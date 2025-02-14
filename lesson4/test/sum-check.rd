INS main
block0 (main):

OUTS main
block0 (main):
var first defined by:
  first: int = call @sum_by_loop n;
var isSame defined by:
  isSame: bool = eq first second;
var second defined by:
  second: int = call @sum_by_formula n;

INS sum_by_loop
block0 (sum_by_loop):

block1 (for_start):
var con defined by:
  con: bool = le i n;
var one defined by:
  one: int = const 1;
var i defined by:
  i: int = const 1;
var sum defined by:
  sum: int = const 0;

block2 (for):
var sum defined by:
  sum: int = const 0;
var i defined by:
  i: int = const 1;
var con defined by:
  con: bool = le i n;
var one defined by:
  one: int = const 1;

block3 (end):
var i defined by:
  i: int = const 1;
var con defined by:
  con: bool = le i n;
var one defined by:
  one: int = const 1;
var sum defined by:
  sum: int = const 0;

OUTS sum_by_loop
block0 (sum_by_loop):
var sum defined by:
  sum: int = const 0;
var one defined by:
  one: int = const 1;
var i defined by:
  i: int = const 1;

block1 (for_start):
var i defined by:
  i: int = const 1;
var sum defined by:
  sum: int = const 0;
var con defined by:
  con: bool = le i n;
var one defined by:
  one: int = const 1;

block2 (for):
var one defined by:
  one: int = const 1;
var sum defined by:
  sum: int = add sum i;
var i defined by:
  i: int = add i one;
var con defined by:
  con: bool = le i n;

block3 (end):
var i defined by:
  i: int = const 1;
var con defined by:
  con: bool = le i n;
var sum defined by:
  sum: int = const 0;
var one defined by:
  one: int = const 1;

INS sum_by_formula
block0 (sum_by_formula):

OUTS sum_by_formula
block0 (sum_by_formula):
var multi defined by:
  multi: int = mul n_1 n;
var sum defined by:
  sum: int = div multi two;
var n_1 defined by:
  n_1: int = add one n;
var two defined by:
  two: int = const 2;
var one defined by:
  one: int = const 1;

