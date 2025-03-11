#!/bin/bash

cd llvm-pass-skeleton/build && LLVM_DIR=/opt/homebrew/opt/llvm/lib/cmake/llvm cmake .. && cd ../..
/opt/homebrew/opt/llvm/bin/clang -fpass-plugin=`echo llvm-pass-skeleton/build/skeleton/SkeletonPass.*` $1