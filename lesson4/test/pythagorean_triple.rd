INS main
block0 (main):

block1 (outer_loop):
var one defined by:
  one: int = const 1;
var n_sq defined by:
  n_sq: int = mul n n;
var b defined by:
  b: int = add b one;
var found defined by:
  found: bool = eq sum n_sq;
var b_sq defined by:
  b_sq: int = mul b b;
var done defined by:
  done: bool = ge a n;
var a_sq defined by:
  a_sq: int = mul a a;
var sum defined by:
  sum: int = add a_sq b_sq;
var a defined by:
  a: int = add a one;

block2 (inner_loop):
var b defined by:
  b: int = add b one;
var b_sq defined by:
  b_sq: int = mul b b;
var one defined by:
  one: int = const 1;
var a_sq defined by:
  a_sq: int = mul a a;
var sum defined by:
  sum: int = add a_sq b_sq;
var a defined by:
  a: int = id one;
var n_sq defined by:
  n_sq: int = mul n n;
var found defined by:
  found: bool = eq sum n_sq;
var done defined by:
  done: bool = ge b a;

block3 (found):
var sum defined by:
  sum: int = add a_sq b_sq;
var done defined by:
  done: bool = ge b a;
var a_sq defined by:
  a_sq: int = mul a a;
var n_sq defined by:
  n_sq: int = mul n n;
var a defined by:
  a: int = id one;
var one defined by:
  one: int = const 1;
var b_sq defined by:
  b_sq: int = mul b b;
var found defined by:
  found: bool = eq sum n_sq;
var b defined by:
  b: int = add b one;

block4 (inner_continue):
var n_sq defined by:
  n_sq: int = mul n n;
var one defined by:
  one: int = const 1;
var sum defined by:
  sum: int = add a_sq b_sq;
var found defined by:
  found: bool = eq sum n_sq;
var b defined by:
  b: int = add b one;
var a_sq defined by:
  a_sq: int = mul a a;
var done defined by:
  done: bool = ge b a;
var a defined by:
  a: int = id one;
var b_sq defined by:
  b_sq: int = mul b b;

block5 (outer_continue):
var one defined by:
  one: int = const 1;
var n_sq defined by:
  n_sq: int = mul n n;
var sum defined by:
  sum: int = add a_sq b_sq;
var found defined by:
  found: bool = eq sum n_sq;
var done defined by:
  done: bool = ge b a;
var b_sq defined by:
  b_sq: int = mul b b;
var a defined by:
  a: int = id one;
var a_sq defined by:
  a_sq: int = mul a a;
var b defined by:
  b: int = add b one;

block6 (finish):
var found defined by:
  found: bool = eq sum n_sq;
var done defined by:
  done: bool = ge a n;
var b_sq defined by:
  b_sq: int = mul b b;
var b defined by:
  b: int = add b one;
var sum defined by:
  sum: int = add a_sq b_sq;
var a defined by:
  a: int = add a one;
var n_sq defined by:
  n_sq: int = mul n n;
var a_sq defined by:
  a_sq: int = mul a a;
var one defined by:
  one: int = const 1;

OUTS main
block0 (main):
var a defined by:
  a: int = id one;
var one defined by:
  one: int = const 1;
var n_sq defined by:
  n_sq: int = mul n n;

block1 (outer_loop):
var one defined by:
  one: int = const 1;
var n_sq defined by:
  n_sq: int = mul n n;
var b defined by:
  b: int = id one;
var found defined by:
  found: bool = eq sum n_sq;
var b_sq defined by:
  b_sq: int = mul b b;
var done defined by:
  done: bool = ge a n;
var a_sq defined by:
  a_sq: int = mul a a;
var sum defined by:
  sum: int = add a_sq b_sq;
var a defined by:
  a: int = add a one;

block2 (inner_loop):
var found defined by:
  found: bool = eq sum n_sq;
var n_sq defined by:
  n_sq: int = mul n n;
var a_sq defined by:
  a_sq: int = mul a a;
var a defined by:
  a: int = id one;
var b defined by:
  b: int = add b one;
var b_sq defined by:
  b_sq: int = mul b b;
var done defined by:
  done: bool = ge b a;
var one defined by:
  one: int = const 1;
var sum defined by:
  sum: int = add a_sq b_sq;

block3 (found):
var b defined by:
  b: int = add b one;
var a defined by:
  a: int = id one;
var found defined by:
  found: bool = eq sum n_sq;
var done defined by:
  done: bool = ge b a;
var n_sq defined by:
  n_sq: int = mul n n;
var one defined by:
  one: int = const 1;
var sum defined by:
  sum: int = add a_sq b_sq;
var a_sq defined by:
  a_sq: int = mul a a;
var b_sq defined by:
  b_sq: int = mul b b;

block4 (inner_continue):
var sum defined by:
  sum: int = add a_sq b_sq;
var n_sq defined by:
  n_sq: int = mul n n;
var found defined by:
  found: bool = eq sum n_sq;
var b_sq defined by:
  b_sq: int = mul b b;
var a defined by:
  a: int = id one;
var done defined by:
  done: bool = ge b a;
var a_sq defined by:
  a_sq: int = mul a a;
var one defined by:
  one: int = const 1;
var b defined by:
  b: int = add b one;

block5 (outer_continue):
var n_sq defined by:
  n_sq: int = mul n n;
var a defined by:
  a: int = add a one;
var b_sq defined by:
  b_sq: int = mul b b;
var one defined by:
  one: int = const 1;
var done defined by:
  done: bool = ge a n;
var sum defined by:
  sum: int = add a_sq b_sq;
var a_sq defined by:
  a_sq: int = mul a a;
var b defined by:
  b: int = add b one;
var found defined by:
  found: bool = eq sum n_sq;

block6 (finish):
var found defined by:
  found: bool = eq sum n_sq;
var one defined by:
  one: int = const 1;
var done defined by:
  done: bool = ge a n;
var b_sq defined by:
  b_sq: int = mul b b;
var sum defined by:
  sum: int = add a_sq b_sq;
var b defined by:
  b: int = add b one;
var a_sq defined by:
  a_sq: int = mul a a;
var a defined by:
  a: int = add a one;
var n_sq defined by:
  n_sq: int = mul n n;

