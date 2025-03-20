#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Analysis/InlineCost.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Dominators.h"
#include "clang/Analysis/CFG.h"
#include <unordered_map>
#include <vector>
#include <stdlib.h>
#include <stdio.h>
#include "llvm/IR/Constants.h"
#include "llvm/IR/IRBuilder.h"

using namespace llvm;

namespace {

class BB_hasher {
public:
  std::size_t operator()(std::vector<BasicBlock*> const& vec) const {
    std::size_t ret = 0;
    for(auto& i : vec) {
      ret ^= std::hash<BasicBlock*>()(i);
    }
    return ret;
  }
};

struct LoopPass : public PassInfoMixin<LoopPass> {

    void dfs_rec(BasicBlock* start, BasicBlock* end, std::vector<BasicBlock*>& visited) {
        visited.push_back(start);
        if (start == end) return;
        auto begin_iter = visited.begin();
        auto end_iter = visited.end();
        for (auto it = pred_begin(start), et = pred_end(start); it != et; ++it) {
            BasicBlock* predecessor = *it;
            if (std::find(begin_iter, end_iter, predecessor) == end_iter) {
                dfs_rec(predecessor, end, visited);
            }
        }
    }

    std::vector<BasicBlock*> dfs(BasicBlock* start, BasicBlock* end, DominatorTree &dom_tree) {
        std::vector<BasicBlock*> visited = std::vector<BasicBlock*>();
        std::vector<BasicBlock*> filtered = std::vector<BasicBlock*>();
        dfs_rec(start, end, visited);
        
        std::copy_if(
            visited.begin(),
            visited.end(),
            std::inserter(filtered, filtered.begin()),
            [&end, &dom_tree](BasicBlock* elt) { return dom_tree.dominates(end, elt); }
        );
        return filtered;
    }

    // returns all the loops in the function `F`. each loop header is in the first elt of the vector
    // the loops are returned in the form of a mapping from loop -> backedge
    std::unordered_map<std::vector<BasicBlock*>, Instruction*, BB_hasher> find_loops(Function &F, DominatorTree &dom_tree) {
        std::unordered_map<std::vector<BasicBlock*>, Instruction*, BB_hasher> all_loops = std::unordered_map<std::vector<BasicBlock*>, Instruction*, BB_hasher>();

        // need all the blocks that `B` dominates
        for (auto& B : F) {
            SmallVector<BasicBlock*> dom_by_B = SmallVector<BasicBlock*>();
            dom_tree.getDescendants(&B, dom_by_B);

            std::set<BasicBlock*> this_loop = std::set<BasicBlock*>();

            // for each block `blk` in `dom_by_B`, check if there is an edge `blk` -> `B`
            for (auto& blk : dom_by_B) {
                Instruction *term_instr = blk->getTerminator();
                // check if any of the successors are `B`
                for (unsigned I = 0, NSucc = term_instr->getNumSuccessors(); I < NSucc; ++I) {
                    BasicBlock *succ = term_instr->getSuccessor(I);
                    if (succ == &B) {
                        std::vector<BasicBlock*> this_loop = dfs(blk, &B, dom_tree);
                        // do stupid stuff to put loop header at the front of the vector
                        auto it = std::find(this_loop.begin(), this_loop.end(), &B);
                        int idx = std::distance(this_loop.begin(), it);
                        auto to_erase = this_loop.begin() + idx;
                        this_loop.erase(std::remove(this_loop.begin(), this_loop.end(), *to_erase), this_loop.end());
                        // // this_loop.erase(to_erase);
                        this_loop.insert(this_loop.begin(), &B);
                        all_loops[this_loop] = term_instr;
                    }
                }
            }
        }

        return all_loops;
    };

    // find basic induction variables of form i += e
    std::unordered_map<Instruction*, Constant*> find_basic_ind_vars(std::vector<BasicBlock*> loop) {
        std::unordered_map<Instruction*, Constant*> ind_vars = std::unordered_map<Instruction*, Constant*>();

        // induction var will always be a phi node - look for phis in each block in the loop
        int idx = 0;
        for (BasicBlock* blk : loop) {
            std::vector<Instruction*> worklist = std::vector<Instruction*>();
            for (BasicBlock::iterator instr = blk->begin(), IE = blk->end(); instr != IE; ++instr) {
                worklist.push_back(&*instr);
            }

            for (auto instr : worklist) {
                if (auto* phi = dyn_cast<PHINode>(instr)) {
                    for (auto& incoming_use : phi->incoming_values()) {
                        if (auto* use_I = dyn_cast<Instruction>(incoming_use)) {
                            // use_I is the use as an instruction - must be an add
                            if (use_I->getOpcode() == Instruction::Add) {
                                // use_I is an add - must be phi + const
                                auto op1 = use_I->getOperand(0);
                                auto op2 = use_I->getOperand(1);
                                bool cond1 = isa<PHINode>(op1) && isa<Constant>(op2);
                                if (cond1) {
                                    Constant* op2_const = dyn_cast<Constant>(op2);
                                    ind_vars[instr] = op2_const;
                                }
                                bool cond2 = isa<PHINode>(op2) && isa<Constant>(op1);
                                if (cond2) {
                                    Constant* op1_const = dyn_cast<Constant>(op2);
                                    ind_vars[instr] = op1_const;
                                }
                            }
                        }
                    }
                }
            }
        }
        return ind_vars;
    }

    std::set<Instruction*> find_derived_ind_vars(std::vector<BasicBlock*> loop, Instruction* basic_var) {
        std::set<Instruction*> derived_vars = std::set<Instruction*>();
        
        // look for anything in the loop of the form j = c*i + d
        for (BasicBlock* blk : loop) {
            std::vector<Instruction*> worklist = std::vector<Instruction*>();
            for (BasicBlock::iterator instr = blk->begin(), IE = blk->end(); instr != IE; ++instr) {
                worklist.push_back(&*instr);
            }

            for (auto instr : worklist) {
                // look for a multiplication that contains a basic induction var
                if (instr->getOpcode() == Instruction::Mul) {
                    // errs() << *instr << " is a mul\n";
                    // see if operands are const and an induction var
                    auto op1 = instr->getOperand(0);
                    auto op2 = instr->getOperand(1);
                    bool op1_is_ind;
                    if (auto op1_sext = dyn_cast<SExtInst>(op1)) {
                        // errs () << "sext branch\n";
                        // check if first operand is a sext of an induction var
                        auto sext_op = op1_sext->getOperand(0);
                        if (auto sext_op_as_instr = dyn_cast<Instruction>(sext_op) ) {
                            op1_is_ind = sext_op_as_instr == basic_var;
                            // errs() << "op1_is_ind: " << op1_is_ind << "\n";
                        }
                    } else if (auto op1_instr = dyn_cast<Instruction>(op1) ) {
                        // check if the first operand is an induction var
                        op1_is_ind = op1_instr == basic_var;
                    } else {
                        // errs() << "else branch\n";
                        op1_is_ind = false;
                    }

                    bool op2_is_ind;
                    if (auto op2_instr = dyn_cast<Instruction>(op2) ) {
                        op2_is_ind = op2_instr == basic_var;
                    } else if (auto op2_sext = dyn_cast<SExtInst>(op2)) {
                        auto sext_op = op2_sext->getOperand(0);
                        if (auto sext_op_as_instr = dyn_cast<Instruction>(sext_op) ) {
                            op1_is_ind = sext_op_as_instr == basic_var;
                        }
                    } else {
                        op2_is_ind = false;
                    }

                    bool cond1 = op1_is_ind && isa<Constant>(op2);
                    bool cond2 = op2_is_ind && isa<Constant>(op1);

                    // ind * const
                    if (cond1 || cond2) {
                        derived_vars.insert(instr);
                    }
                } else if (instr->getOpcode() == Instruction::Add) {
                    // looking for things of form derived_var + const
                    auto op1 = instr->getOperand(0);
                    auto op2 = instr->getOperand(1);

                    bool op1_is_derived;
                    if (auto op1_instr = dyn_cast<Instruction>(op1)) {
                        op1_is_derived = derived_vars.count(op1_instr) > 0;
                    } else {
                        op1_is_derived = false;
                    }

                    bool op2_is_derived;
                    if (auto op2_instr = dyn_cast<Instruction>(op2)) {
                        op2_is_derived = derived_vars.count(op2_instr) > 0;
                    } else {
                        op2_is_derived = false;
                    }

                    bool cond1 = op1_is_derived && isa<Constant>(op2);
                    bool cond2 = op2_is_derived && isa<Constant>(op1);

                    if (cond1 || cond2) {
                        derived_vars.insert(instr);
                    }

                }
            }
        }

        return derived_vars;
    }

    AllocaInst* traverse_gep_to_alloc(Instruction* instr) {
        if (auto* instr_as_gep = dyn_cast<GetElementPtrInst>(instr)) {
            auto* ptr_operand = instr_as_gep->getPointerOperand();
            Instruction* ptr_operand_instr = dyn_cast<Instruction>(ptr_operand);
            return traverse_gep_to_alloc(ptr_operand_instr);
        } else if (auto* instr_as_alloc = dyn_cast<AllocaInst>(instr)) {
            return instr_as_alloc;
        } else {
            return nullptr;
        }
    }

    // finds the base pointer(s) being indexed by the given derived var
    std::set<AllocaInst*> find_ptr_idxed_by_derived_var(Instruction* derived_var) {
        std::set<AllocaInst*> ptrs = std::set<AllocaInst*>();
        for (auto* user : derived_var->users()) {
            if (auto* user_as_instr = dyn_cast<Instruction>(user)) {
                if (auto* user_as_sext = dyn_cast<SExtInst>(user_as_instr)) {
                    // errs() << "user is sext: " << *user_as_sext << "\n";
                    for (auto* sext_user : user_as_sext->users()) {
                        if (auto* sext_user_instr = dyn_cast<Instruction>(sext_user)) {
                            AllocaInst* base_ptr = traverse_gep_to_alloc(sext_user_instr);
                            ptrs.insert(base_ptr);
                        }
                    }
                }
                AllocaInst* base_ptr = traverse_gep_to_alloc(user_as_instr);
                ptrs.insert(base_ptr);
            }
        }
        return ptrs;
    }

    // find all geps that use a derived var
    std::set<GetElementPtrInst*> find_geps_from_derived(Instruction* derived_var) {
        std::set<GetElementPtrInst*> geps = std::set<GetElementPtrInst*>();
        for (auto* user : derived_var->users()) {
            if (auto* user_gep = dyn_cast<GetElementPtrInst>(user)) {
                geps.insert(user_gep);
            }
        }

        return geps;
    }

    ConstantInt* get_stride(Instruction* derived_var) {
        if (derived_var->getOpcode() == Instruction::Mul) {
            Value* op1 = derived_var->getOperand(0);
            Value* op2 = derived_var->getOperand(1);
            if (ConstantInt* op1_const = dyn_cast<ConstantInt>(op1)) {
                return op1_const;
            } else if (ConstantInt* op2_const = dyn_cast<ConstantInt>(op2)) {
                return op2_const;
            }
        } else if (derived_var->getOpcode() == Instruction::Add || derived_var->getOpcode() == Instruction::Sub) {
            Type* add_ty = derived_var->getType();
            Constant* one = ConstantInt::get(add_ty, 1);
            if (ConstantInt* one_int = dyn_cast<ConstantInt>(one)) {
                return one_int;
            }
        }
        return nullptr;
    }

    ConstantInt* get_offset(Instruction* derived_var) {
        if (derived_var->getOpcode() == Instruction::Add || derived_var->getOpcode() == Instruction::Sub) {
            Value* op1 = derived_var->getOperand(0);
            Value* op2 = derived_var->getOperand(1);
            if (ConstantInt* op1_const = dyn_cast<ConstantInt>(op1)) {
                return op1_const;
            } else if (ConstantInt* op2_const = dyn_cast<ConstantInt>(op2)) {
                return op2_const;
            }
        } else if (derived_var->getOpcode() == Instruction::Mul) {
            // return constant 0
            auto* mul_ty = derived_var->getType();
            Constant* zero = ConstantInt::getNullValue(mul_ty);
            if (ConstantInt* zero_int = dyn_cast<ConstantInt>(zero)) {
                return zero_int;
            }
        }
        return nullptr;
    }

    void replace_derived_in_gep(Instruction* derived_var, PHINode* phi) {
        std::set<GetElementPtrInst*> geps = find_geps_from_derived(derived_var);
        std::set<AllocaInst*> allocs = find_ptr_idxed_by_derived_var(derived_var);
        Constant* stride = get_stride(derived_var);
        for (GetElementPtrInst* gep : geps) {
            int i = 0;
            for (Use& operand : gep->operands()) {
                if (Instruction* operand_instr = dyn_cast<Instruction>(operand)) {
                    if (operand_instr == derived_var) {
                        gep->setOperand(i, stride);
                    } else {
                        AllocaInst* alloc = traverse_gep_to_alloc(operand_instr);
                        if (allocs.count(alloc) > 0) {
                            gep->setOperand(i, phi);
                        }
                    }
                }
                i++;
            }
        }
    }

    // insert a phi in the loop header for the pointer
    PHINode* build_phi(LLVMContext &C, std::set<GetElementPtrInst*> geps, std::set<AllocaInst*> allocs, Instruction* header_phi) {
        IRBuilder<> builder(header_phi);
        int numReserved = geps.size() + allocs.size();
        // Type* ty = Type::getPrimitiveType(C, Type::PointerTyID);
        Type* i32_ty = Type::getInt32Ty(C);
        Type* ty = PointerType::get(i32_ty, 0);
        PHINode* phi = builder.CreatePHI(ty, 0);
        int i = 0;
        for (auto* gep : geps) {
            phi->addIncoming(gep, gep->getParent());
            i++;
        }
        // errs() << "added geps\n";

        for (auto* alloc : allocs) {
            // errs() << "alloc: " << *alloc << "\n";
            phi->addIncoming(alloc, alloc->getParent());
            i++;
        }

        // errs() << "added allocs\n";

        return phi;
    }


    Value* get_loop_guard(BasicBlock* header) {
        // the header's terminator will be a branch to the loop body
        // look at the header and get the bool that it is branching on
        Instruction* term = header->getTerminator();
        if (BranchInst* branch = dyn_cast<BranchInst>(term)) {
            if (branch->isConditional()) {
                return branch->getCondition();
            }
        }
        return nullptr;
    }

    // rewrite guard if it is the form of ind_var < const
    void rewrite_guard(Value* guard, std::unordered_map<Instruction*, Constant*> ind_vars, Instruction* derived_var, APInt c, APInt d) {
        Instruction* guard_instr = dyn_cast<Instruction>(guard);
        if (ICmpInst* icmp = dyn_cast<ICmpInst>(guard)) {
            ICmpInst::Predicate pred = icmp->getPredicate();
            if (icmp->isLT(pred) || icmp->isLE(pred)) {
                Value* op1 = icmp->getOperand(0);
                Value* op2 = icmp->getOperand(1);
                
                Instruction* op1_instr = dyn_cast<Instruction>(op1);
                Instruction* op2_instr = dyn_cast<Instruction>(op2);
                bool op1_is_ind = ind_vars[op1_instr] != nullptr;
                bool op1_is_const = isa<Constant>(op1);
                bool op2_is_ind = ind_vars[op2_instr] != nullptr;
                bool op2_is_const = isa<Constant>(op2);

                if (op1_is_ind && op2_is_const) {
                    // change the ind var to the derived one
                    guard_instr->setOperand(0, derived_var);

                    // bound is going to be d+op2*c
                    ConstantInt* op2_const_int = dyn_cast<ConstantInt>(op2);
                    APInt op2_int = op2_const_int->getValue();
                    APInt new_guard_ap = op2_int * c + d;
                    Constant* new_guard = ConstantInt::get(derived_var->getType(), new_guard_ap);

                    guard_instr->setOperand(1, new_guard);
                }
            }
        }
    }

    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM) {
        errs() << "Saw " << F.getName() << "\n";
        DominatorTree& dom_tree = AM.getResult<DominatorTreeAnalysis>(F);

        LLVMContext &C = F.getContext();

        // find all loops
        std::unordered_map<std::vector<BasicBlock*>, Instruction*, BB_hasher> all_loops = find_loops(F, dom_tree);
        for (auto& [loop, backedge]: all_loops) {
            for (auto blk : loop) {
                // errs() << "blk: " << *blk << "\n";
            }

            std::unordered_map<Instruction*, Constant*> ind_vars = find_basic_ind_vars(loop);
            // for each basic induction variable, we find all its derived induction variables
            for (auto& [ind_var, e_const] : ind_vars) {
                // errs() << "ind_var: " << *ind_var << "\n";

                std::set<Instruction*> derived_vars = find_derived_ind_vars(loop, ind_var);
                for (Instruction* derived_var : derived_vars) {
                    // errs() << "derived_var: " << *derived_var << "\n";

                    BasicBlock* header = loop[0];
                    auto* pp = header->getFirstNonPHI();
                    IRBuilder<> phi_builder(pp);
                    Type* derived_ty = derived_var->getType();
                    PHINode* phi = phi_builder.CreatePHI(derived_ty, 0);

                    ConstantInt* d = get_offset(derived_var); // the j = c*i + d
                    // ConstantInt* e = get_offset(ind_var); // the e in i += e
                    ConstantInt* e = dyn_cast<ConstantInt>(e_const);
                    ConstantInt* c = get_stride(derived_var);

                    APInt c_val = c->getValue();
                    APInt e_val = e->getValue();
                    APInt d_val = d->getValue();
                    APInt c_times_e = c_val * e_val;
                    Constant* c_times_e_const = ConstantInt::get(derived_ty, c_times_e);

                    // for each derived var, in all of the preds of the header (that aren't members of the loop), 
                    // insert j = d; we do this by making a phi that takes a value of 0 from all the preds
                    for (auto it = pred_begin(header), et = pred_end(header); it != et; ++it) {
                        BasicBlock* pred = *it;
                        // only add to phi if the pred is not in the loop
                        if (std::find(loop.begin(), loop.end(), pred) == loop.end()) {
                            phi->addIncoming(d, pred);
                        }
                    }

                    IRBuilder<> der_builder(backedge);
                    Value* der_replacement = der_builder.CreateAdd(phi, c_times_e_const);
                    Instruction* der_rep_instr = dyn_cast<Instruction>(der_replacement);
                    phi->addIncoming(der_replacement, backedge->getParent());

                    // also want to replace all uses of the old derived variable with the new one
                    derived_var->replaceAllUsesWith(phi);

                    // now rewrite the guard
                    Value* guard = get_loop_guard(header);
                    rewrite_guard(guard, ind_vars, phi, c_val, d_val);
                }
            }
        }

        return PreservedAnalyses::none();
    };
};
}

// static RegisterPass<LoopPass> X("induction-elim",
//                                             "a useful pass", false, false);
// FUNCTION_PASS("induction-elim", LoopPass());

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
// getLoopPassPluginInfo() {
    return {
        .APIVersion = LLVM_PLUGIN_API_VERSION,
        .PluginName = "induction-elim",
        .PluginVersion = "v0.1",
        .RegisterPassBuilderCallbacks = [](PassBuilder &PB) {
            PB.registerPipelineStartEPCallback(
                [](ModulePassManager &MPM, OptimizationLevel Level) {
                    MPM.addPass(createModuleToFunctionPassAdaptor(LoopPass()));
                    return true;
                });
            PB.registerPipelineParsingCallback(
                [](StringRef Name, llvm::FunctionPassManager &PM,
                   ArrayRef<llvm::PassBuilder::PipelineElement>) {
                  if (Name == "induction-elim") {
                    PM.addPass(LoopPass());
                    return true;
                  }
                  return false;
                });
        }
    };
}
// #ifndef LLVM_LOOP_PASS_LINK_INTO_TOOLS
// extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
// llvmGetPassPluginInfo() {
//   return getLoopPassPluginInfo();
// }
// #endif

// auto Plugin = PassPlugin::Load("../build/loop/LoopPass.dylib");
// if (!Plugin)
//   report_error();
// // Register plugin extensions in PassBuilder.
// Plugin.registerPassBuilderCallbacks(PB);