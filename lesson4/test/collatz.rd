INS main
block0 (main):

block1 (cond):
var three defined by:
  three: int = const 3;
var one defined by:
  one: int = const 1;
var even defined by:
  even: bool = eq x doublehalf;
var half defined by:
  half: int = div x two;
var doublehalf defined by:
  doublehalf: int = mul half two;
var eq_one defined by:
  eq_one: bool = eq x one;
var x defined by:
  x: int = add x one;
var two defined by:
  two: int = const 2;

block2 (loop):
var half defined by:
  half: int = div x two;
var two defined by:
  two: int = const 2;
var one defined by:
  one: int = const 1;
var doublehalf defined by:
  doublehalf: int = mul half two;
var even defined by:
  even: bool = eq x doublehalf;
var x defined by:
  x: int = add x one;
var three defined by:
  three: int = const 3;
var eq_one defined by:
  eq_one: bool = eq x one;

block3 (even):
var two defined by:
  two: int = const 2;
var even defined by:
  even: bool = eq x doublehalf;
var one defined by:
  one: int = const 1;
var doublehalf defined by:
  doublehalf: int = mul half two;
var x defined by:
  x: int = add x one;
var half defined by:
  half: int = div x two;
var eq_one defined by:
  eq_one: bool = eq x one;
var three defined by:
  three: int = const 3;

block4 (odd):
var doublehalf defined by:
  doublehalf: int = mul half two;
var three defined by:
  three: int = const 3;
var eq_one defined by:
  eq_one: bool = eq x one;
var even defined by:
  even: bool = eq x doublehalf;
var x defined by:
  x: int = add x one;
var two defined by:
  two: int = const 2;
var one defined by:
  one: int = const 1;
var half defined by:
  half: int = div x two;

block5 (print):
var eq_one defined by:
  eq_one: bool = eq x one;
var even defined by:
  even: bool = eq x doublehalf;
var one defined by:
  one: int = const 1;
var three defined by:
  three: int = const 3;
var x defined by:
  x: int = add x one;
var half defined by:
  half: int = div x two;
var two defined by:
  two: int = const 2;
var doublehalf defined by:
  doublehalf: int = mul half two;

block6 (end):
var x defined by:
  x: int = add x one;
var one defined by:
  one: int = const 1;
var doublehalf defined by:
  doublehalf: int = mul half two;
var half defined by:
  half: int = div x two;
var three defined by:
  three: int = const 3;
var even defined by:
  even: bool = eq x doublehalf;
var eq_one defined by:
  eq_one: bool = eq x one;
var two defined by:
  two: int = const 2;

OUTS main
block0 (main):
var one defined by:
  one: int = const 1;
var two defined by:
  two: int = const 2;
var three defined by:
  three: int = const 3;

block1 (cond):
var three defined by:
  three: int = const 3;
var one defined by:
  one: int = const 1;
var even defined by:
  even: bool = eq x doublehalf;
var half defined by:
  half: int = div x two;
var doublehalf defined by:
  doublehalf: int = mul half two;
var eq_one defined by:
  eq_one: bool = eq x one;
var x defined by:
  x: int = add x one;
var two defined by:
  two: int = const 2;

block2 (loop):
var half defined by:
  half: int = div x two;
var two defined by:
  two: int = const 2;
var one defined by:
  one: int = const 1;
var doublehalf defined by:
  doublehalf: int = mul half two;
var even defined by:
  even: bool = eq x doublehalf;
var x defined by:
  x: int = add x one;
var three defined by:
  three: int = const 3;
var eq_one defined by:
  eq_one: bool = eq x one;

block3 (even):
var even defined by:
  even: bool = eq x doublehalf;
var doublehalf defined by:
  doublehalf: int = mul half two;
var three defined by:
  three: int = const 3;
var eq_one defined by:
  eq_one: bool = eq x one;
var one defined by:
  one: int = const 1;
var x defined by:
  x: int = div x two;
var two defined by:
  two: int = const 2;
var half defined by:
  half: int = div x two;

block4 (odd):
var eq_one defined by:
  eq_one: bool = eq x one;
var x defined by:
  x: int = add x one;
var two defined by:
  two: int = const 2;
var three defined by:
  three: int = const 3;
var even defined by:
  even: bool = eq x doublehalf;
var one defined by:
  one: int = const 1;
var doublehalf defined by:
  doublehalf: int = mul half two;
var half defined by:
  half: int = div x two;

block5 (print):
var eq_one defined by:
  eq_one: bool = eq x one;
var even defined by:
  even: bool = eq x doublehalf;
var one defined by:
  one: int = const 1;
var three defined by:
  three: int = const 3;
var x defined by:
  x: int = add x one;
var half defined by:
  half: int = div x two;
var two defined by:
  two: int = const 2;
var doublehalf defined by:
  doublehalf: int = mul half two;

block6 (end):
var x defined by:
  x: int = add x one;
var one defined by:
  one: int = const 1;
var doublehalf defined by:
  doublehalf: int = mul half two;
var half defined by:
  half: int = div x two;
var three defined by:
  three: int = const 3;
var even defined by:
  even: bool = eq x doublehalf;
var eq_one defined by:
  eq_one: bool = eq x one;
var two defined by:
  two: int = const 2;

