from math import log2
import subprocess
import os
import time
import matplotlib.pyplot as plt
import csv
import ast

iters = [1, 3, 5]
limits = [0, 8, 64, 256, 512, 1024, 2048, 4096]
upper_limit = log2(limits[-1])
colors = {1: 'red', 3: 'blue', 5: 'green'}

def find_and_replace(iter, limit):
    return f'''
    #include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Analysis/InlineCost.h"
#include "llvm/IR/InstIterator.h"

using namespace llvm;

namespace {{

    int N = {iter};
    int LIMIT = {limit};

struct SkeletonPass : public PassInfoMixin<SkeletonPass> {{
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {{
        errs() << "N: " << N << "\\n";
        errs() << "LIMIT: " << LIMIT << "\\n";
        for (auto& F : M) {{
            for (int i = 0; i < N; i++) {{
                std::vector<Instruction *> worklist;
                for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {{
                    worklist.push_back(&*I);
                }}
                for (auto I : worklist) {{
                    if (auto* caller = dyn_cast<CallInst>(I)) {{
                        Function* callee = caller->getCalledFunction();
                        if (callee->getInstructionCount() < LIMIT 
                            && isInlineViable(*callee).isSuccess()) {{
                            // inline the function if it is short
                            InlineFunctionInfo ifi;
                            InlineFunction(*caller, ifi);
                        }}
                    }}
                }}
            }}
        }}
        
        return PreservedAnalyses::none();
    }};
}};
}}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {{
    return {{
        .APIVersion = LLVM_PLUGIN_API_VERSION,
        .PluginName = "Skeleton pass",
        .PluginVersion = "v0.1",
        .RegisterPassBuilderCallbacks = [](PassBuilder &PB) {{
            PB.registerPipelineStartEPCallback(
                [](ModulePassManager &MPM, OptimizationLevel Level) {{
                    MPM.addPass(SkeletonPass());
                }});
        }}
    }};
}}

    '''

def benchmark_progs():
    # times is a mapping from (name, iter, limit) to avged exec time
    times = dict()
    for file in os.listdir('examples'):
        name = os.path.splitext(file)[0]
        d = read_csv('data.csv')
        if name in map(lambda tup: tup[0], d.keys()):
            continue

        for iter in iters: 
            print(f'iter: {iter}')
            for limit in limits:
                # replace stuff in the program
                program = find_and_replace(iter, limit)
                with open('llvm-pass-skeleton/skeleton/Skeleton.cpp', 'w') as f:
                    f.write(program)

                # build the pass
                subprocess.run(['./build.sh'])

                # compile the src file
                subprocess.run(['./compile.sh', 'examples/' + file])

                # executable name
                name = os.path.splitext(file)[0]
                executable = 'examples-build/' + os.path.splitext(file)[0]

                avg = 0
                # avg over 5 runs
                for _ in range(5):
                    start = time.perf_counter()
                    subprocess.run(['./' + executable + '.out'])
                    end = time.perf_counter()
                    elapsed = end-start
                    avg += elapsed
                avg = avg/5.0
                times[(name, iter, limit)] = avg
    # save to csv
    with open('data.csv', 'a') as f:
        w = csv.writer(f)
        w.writerows(times.items())

def read_csv(filename):
    d = {}
    with open(filename) as f:
        reader = csv.reader(f)
        for row in reader:
            k,v = row
            tup = ast.literal_eval(k)
            d[tup] = v
    return d

def graph_dict(dict, name):
    fig1, ax1 = plt.subplots()
    ax1.set_xticks([i for i in range(int(upper_limit+1))])
    ax1.set_xticklabels([0] + [2**i for i in range(int(upper_limit))])
    ax1.set_xlabel("inline threshold")
    ax1.set_ylabel("exec time (s)")
    for k in dict:
        # tup = ast.literal_eval(k)
        exec, iter, limit = k
        if exec == name:
            elapsed = float(dict[k])
            color = colors[iter]
            if limit == 0:
                ax1.plot(limit, elapsed, marker='o', color=color, label=f"N={iter}")
            else:
                ax1.plot(log2(int(limit)), elapsed, marker='o', color=color)
    plt.legend(loc="upper left")
    ax1.set_title(f"{name} function inline results")
    fig1.savefig(f"{name}.png")

def graph_all(dict):
    for file in os.listdir('examples-build'):
        name = file.split('.')[0]
        graph_dict(dict, name)

def avg_over_bmark(dict, iter_to_avg, lim_to_avg):
    avg = 0
    counter = 0
    for k in dict.keys():
        exec, iter, lim = k
        if iter == iter_to_avg and lim == lim_to_avg:
            avg += float(dict[k])
            counter += 1
    avg = avg/counter
    return avg

# avg across all benchmarks, get % speedup for:
#   - N = 1, lim = 64, 1024, 4096
#   - N = 3, lim = 64, 1024, 4096
#   - N = 5, lim = 64, 1024, 4096
def analyze_data(dict):
    limits = [64, 1024, 4096]
    for iter in iters:
        for lim in limits:
            baseline = avg_over_bmark(dict, iter, 0)
            avg = avg_over_bmark(dict, iter, lim)
            speedup = baseline/avg
            print(f"N = {iter}, lim = {lim}: {speedup}x speedup")

        
if __name__ == "__main__":
    # benchmark_progs()
    dict = read_csv('data.csv')
    # graph_all(dict)
    analyze_data(dict)