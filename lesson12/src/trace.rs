use std::{collections::{HashMap, VecDeque}, path::PathBuf, process::Command};

use bril_rs::{Code, EffectOps, Function, Instruction, Program, Type, ValueOps};
use lesson2::{BasicBlock, ControlFlow, build_blocks};
use serde::{Deserialize, Serialize};
use serde_json::Error;
use utils::cfg::{is_branch, is_terminator_or_label};

#[derive(Serialize, Deserialize, Clone)]
pub struct Trace {
    pub instrs: Vec<Instruction>,
}

impl Trace {
    pub fn new(instrs: Vec<Instruction>) -> Self {
        Self { instrs }
    }
}

pub struct SpecOpt {
    pub trace: Trace,
    pub program: Vec<ControlFlow>,
    pub quit_lbl: String,
    call_dests: Vec<String>,
    call_types: Vec<Type>,
}

impl SpecOpt {
    pub fn new(quit_lbl: String) -> Self {
        Self {
            trace: Trace::new(vec![]),
            program: vec![],
            quit_lbl,
            call_dests: vec![],
            call_types: vec![],
        }
    }

    pub fn prune_trace(&mut self) {
        let new_trace:Vec<Instruction> = self
        .trace
        .instrs.clone()
        .into_iter()
        .filter(|instr| match instr {
            Instruction::Constant { .. } => true,
            Instruction::Value {
                op, dest, op_type, ..
            } => {
                if *op == ValueOps::Call {
                    self.call_dests.push(dest.to_string());
                    self.call_types.push(op_type.clone());
                    false
                } else {
                    true
                }
            }
            Instruction::Effect { op, args, .. } => {
                let ret_empty = *op == EffectOps::Return && args.is_empty();
                if *op == EffectOps::Call || ret_empty {
                    false
                } else {
                    true
                }
            }
        }).collect();

        self.trace = Trace::new(new_trace);
        
    }

    // turns all branches into guards, remove calls, remove rets
    pub fn speculate_trace(&mut self) -> Trace {
        let mut new_trace: VecDeque<Instruction> = self
            .trace
            .instrs
            .iter()
            .filter(|instr| match instr {
                Instruction::Constant { .. } => true,
                Instruction::Value {
                    op, dest, op_type, ..
                } => {
                    if *op == ValueOps::Call {
                        self.call_dests.push(dest.to_string());
                        self.call_types.push(op_type.clone());
                        false
                    } else {
                        true
                    }
                }
                Instruction::Effect { op, args, .. } => {
                    let ret_empty = *op == EffectOps::Return && args.is_empty();
                    if *op == EffectOps::Call || ret_empty || *op == EffectOps::Jump {
                        false
                    } else {
                        true
                    }
                }
            })
            .collect::<Vec<_>>()
            .into_iter()
            .map(|instr| {
                match instr {
                    Instruction::Constant { .. } => instr.clone(),
                    Instruction::Value {
                        op,
                        args,
                        dest,
                        funcs,
                        op_type,
                        ..
                    } => instr.clone(),
                    Instruction::Effect {
                        op, args, labels, ..
                    } => {
                        // replace branch with guard
                        if *op == EffectOps::Branch {
                            let cond = args[0].clone();
                            Instruction::Effect {
                                op: EffectOps::Guard,
                                args: vec![cond],
                                labels: vec![self.quit_lbl.clone()],
                                funcs: vec![],
                                pos: None,
                            }
                        // replace ret with id
                        } else if *op == EffectOps::Return {
                            let call_dest = self.call_dests.pop().unwrap();
                            let call_type = self.call_types.pop().unwrap();
                            Instruction::Value {
                                op: ValueOps::Id,
                                args: args.clone(),
                                dest: call_dest,
                                funcs: vec![],
                                labels: vec![],
                                pos: None,
                                op_type: call_type,
                            }
                        } else {
                            instr.clone()
                        }
                    }
                }
            })
            .collect();

        // add spec and commit
        new_trace.push_front(Instruction::Effect {
            args: vec![],
            funcs: vec![],
            labels: vec![],
            op: EffectOps::Speculate,
            pos: None
        });
        new_trace.push_back(Instruction::Effect {
            args: vec![],
            funcs: vec![],
            labels: vec![],
            op: EffectOps::Commit,
            pos: None,
        });
        new_trace.push_back(Instruction::Effect {
            args: vec![],
            funcs: vec![],
            labels: vec!["trace_success".to_string()],
            op: EffectOps::Jump,
            pos: None,
        });
        Trace::new(new_trace.into())
    }

    pub fn find_main(&self) -> (&ControlFlow, usize) {
        for (func_id, func) in self.program.iter().enumerate() {
            if func.name == "main" {
                return (&func, func_id);
            }
        }
        panic!("no main??");
    }

    pub fn build_blocks_trace(func: Function) -> (String, Vec<BasicBlock>, HashMap<String, usize>) {
        let name = func.name;
        let mut block = BasicBlock::default();
        block.name = name.clone();
        let mut blocks = Vec::new();
        let mut label_to_block = HashMap::new();
    
        for code in &func.instrs {
            match code {
                Code::Label { label, .. } => {
                    // if !block.instrs.is_empty() {
                    //     blocks.push(block.clone());
                    //     block = BasicBlock::default();
                    // }
                    if block.name != "" {
                        blocks.push(block.clone());
                        block = BasicBlock::default();
                    }
                    block.name = format!("{}", label.to_string());
                    let idx = blocks.len();
                    label_to_block.insert(label.to_string(), idx);
                }
                Code::Instruction(instruction) => {
                    block.instrs.push(instruction.clone());
                    if is_terminator_or_label(code) {
                        blocks.push(block.clone());
                        block = BasicBlock::default();
                    }
                }
            };
        }
        blocks.push(block.clone());
        (name, blocks, label_to_block)
    }

    // forms a mini cfg of the trace to figure out where to stitch it back in
    // this is where we jump on a successful trace
    // call before pruning or doing anything
    pub fn find_stitch_pt(&self, trace: &Trace) -> (usize, usize) {
        let (main, _) = self.find_main();
        let main_func = bril_rs::Function {
            args: main.args.clone(),
            instrs: trace
                .instrs
                .iter()
                .map(|instr| Code::Instruction(instr.clone()))
                .collect(),
            name: "main".to_string(),
            pos: None,
            return_type: main.ret_type.clone(),
        };

        let (_, blocks, _) = Self::build_blocks_trace(main_func);
        // println!("trace: {:#?}", trace.instrs);
        // println!("blks from trace: {:#?}", blocks);
        
        let last_blk = blocks.last().unwrap();

        (blocks.len()-1, last_blk.instrs.len())
    }

    fn find_owner_blk(&self, blks: &Vec<BasicBlock>, instr: &Instruction) -> usize {
        println!("finding {instr}");
        for (blk_id, blk) in blks.iter().enumerate() {
            if blk.instrs.contains(instr) {
                return blk_id;
            }
        }
        panic!("oops");
    }

    fn find_instr_idx(&self, blk: &BasicBlock, instr: &Instruction) -> usize {
        for (instr_id, instr_in_blk) in blk.instrs.iter().enumerate() {
            if instr == instr_in_blk {
                return instr_id;
            }
        }
        panic!("oops");
    }

    // find stitching point by getting the blk of the last traced instr
    pub fn find_stitch_pt2(&self, trace: &Trace) -> (usize, usize) {
        let trace_len = trace.instrs.len();
        let last_traced_instr = &trace.instrs[trace_len-2];
        let (main, _) = self.find_main();
        // let main_func = bril_rs::Function {
        //     args: main.args.clone(),
        //     instrs: trace
        //         .instrs
        //         .iter()
        //         .map(|instr| Code::Instruction(instr.clone()))
        //         .collect(),
        //     name: "main".to_string(),
        //     pos: None,
        //     return_type: main.ret_type.clone(),
        // };

        // let (_, blocks, _) = build_blocks(main_func);
        
        // find the blk that has the last traced instr
        let owner_blk_id = self.find_owner_blk(&main.blocks, last_traced_instr);
        let owner_blk = &main.blocks[owner_blk_id];
        let instr_id = self.find_instr_idx(owner_blk, last_traced_instr);

        (owner_blk_id, instr_id)
    }

    // form the success blk
    pub fn split_end_trace(&mut self, stitch_pt: (usize, usize)) {
        let (blk_id, instr_id) = stitch_pt;
        let (main, main_id) = self.find_main();
        let mut main = main.clone();

        let trace_blk = &mut main.blocks[blk_id];
        // let new_instrs = trace_blk.instrs.split_off(instr_id);
        let new_instrs = Vec::from_iter(trace_blk.instrs[instr_id..].iter().cloned());

        let mut new_blk = BasicBlock::default();
        new_blk.name = "trace_success".to_string();
        new_blk.instrs = new_instrs;
        main.blocks.push(new_blk);
        self.program[main_id] = main;
    }

    pub fn add_trace_to_main(&mut self) {
        let (main, main_id) = self.find_main();
        let mut old_first_blk = main.blocks[0].clone();
        old_first_blk.name = self.quit_lbl.clone();

        let mut main = main.clone();
        let mut trace_blk = BasicBlock::default();
        trace_blk.name = "main".to_string();
        trace_blk.instrs = self.trace.instrs.clone();

        main.blocks[0] = trace_blk;
        main.blocks.push(old_first_blk);

        self.program[main_id] = main;
    }
}

// starts the trace at main and traces for 20 instructions
pub fn form_traces<R: std::io::Read>(mut input: R) -> Trace {
    // println!("forming trace");

    let mut buf = String::new();
    input.read_to_string(&mut buf).unwrap();

    let mut trace: Trace =
        serde_json::from_str(&buf).expect("couldn't parse json into bril program");

    if trace.instrs.len() > 20 {
        let _ = trace.instrs.split_off(20);
    }

    trace
}
