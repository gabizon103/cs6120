#!/bin/python3
import os
import time
import subprocess
import sys

def main():
    filepath = sys.argv[1]
    name = filepath.split('/')[-1].split('.')[0]

    # build the pass
    subprocess.run(['./build.sh'])

    # compile without optimizations
    subprocess.run(['./compile.sh', f'{filepath}'])

    # compile with optimizations
    subprocess.run(['./compile2.sh', f'{filepath}'])

    avg_unopt = 0
    avg_opt = 0
    for _ in range(5):
        start = time.perf_counter()
        subprocess.run([f'./examples-build/{name}-unopt.o'])
        end = time.perf_counter()
        elapsed = end - start
        avg_unopt += elapsed

        start = time.perf_counter()
        subprocess.run([f'./examples-build/{name}-opt.o'])
        end = time.perf_counter()
        elapsed = end - start
        avg_opt += elapsed
    avg_unopt = avg_unopt/5.0
    avg_opt = avg_opt/5.0
    speedup = avg_unopt/avg_opt

    print(f"avg_opt: {avg_opt}\n")
    print(f"avg_unopt: {avg_unopt}\n")
    print(f"speedup: {speedup}\n")

if __name__ == "__main__":
    main()