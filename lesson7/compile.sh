#!/bin/bash

filename=$(basename "$1" .c)
/opt/homebrew/opt/llvm/bin/clang -fpass-plugin=`echo llvm-pass-skeleton/build/skeleton/SkeletonPass.*` $1 -o examples-build/$filename.out
