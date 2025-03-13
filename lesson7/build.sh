#!/bin/bash
N=$1
LIM=$2
cd llvm-pass-skeleton/build && LLVM_DIR=/opt/homebrew/opt/llvm/lib/cmake/llvm cmake -DLIM=$LIMIT -DN=$N .. && make && cd ../..
