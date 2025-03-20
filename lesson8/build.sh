#!/bin/bash

cd build && LLVM_DIR=/opt/homebrew/opt/llvm/lib/cmake/llvm cmake .. && make && cd ../..
