#!/bin/bash

filename=$(basename "$1" .c)
/opt/homebrew/opt/llvm/bin/clang -emit-llvm -S -O0 -Xclang -disable-O0-optnone $1 -o - | /opt/homebrew/opt/llvm/bin/opt -p 'mem2reg' -S | /opt/homebrew/opt/llvm/bin/clang -x ir -fpass-plugin=build/loop/LoopPass.dylib -S -emit-llvm -o - -
