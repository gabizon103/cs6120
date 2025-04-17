#!/bin/bash

filename=$(basename "$1" .c)
/opt/homebrew/opt/llvm/bin/clang -Xclang -disable-O0-optnone $1 -emit-llvm -S -o - | /opt/homebrew/opt/llvm/bin/opt -p 'mem2reg' -S | /opt/homebrew/opt/llvm/bin/opt --load-pass-plugin=build/loop/LoopPass.dylib -p 'induction-elim' -p 'dce' -S | /opt/homebrew/opt/llvm/bin/clang -x ir -S -emit-llvm -o - -
