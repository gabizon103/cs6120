#!/bin/bash

cargo build
for test in test/*.bril; do
  echo "$test"
  bril2json < "$test" | RUSTFLAGS="-Awarnings" cargo run -- --analysis reaching-defs -s
done