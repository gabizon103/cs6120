INS main
block0 (main):

block1 (loop_cond):
var cond1 defined by:
  cond1: bool = eq x one;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;
var cond0 defined by:
  cond0: bool = lt x zero;
var a defined by:
  a: int = const 1;
var y defined by:
  y: int = mul a x;
var z defined by:
  z: int = mul a a;

block2 (body):
var a defined by:
  a: int = const 1;
var z defined by:
  z: int = mul a a;
var one defined by:
  one: int = const 1;
var cond0 defined by:
  cond0: bool = lt x zero;
var cond1 defined by:
  cond1: bool = eq x one;
var zero defined by:
  zero: int = const 0;
var y defined by:
  y: int = mul a x;

block3 (tru):
var zero defined by:
  zero: int = const 0;
var a defined by:
  a: int = const 1;
var one defined by:
  one: int = const 1;
var cond1 defined by:
  cond1: bool = eq x one;
var z defined by:
  z: int = mul a a;
var y defined by:
  y: int = mul a x;
var cond0 defined by:
  cond0: bool = lt x zero;

block4 (fals):
var zero defined by:
  zero: int = const 0;
var z defined by:
  z: int = mul a a;
var cond1 defined by:
  cond1: bool = eq x one;
var y defined by:
  y: int = mul a x;
var cond0 defined by:
  cond0: bool = lt x zero;
var one defined by:
  one: int = const 1;
var a defined by:
  a: int = const 1;

block5 (exit):
var a defined by:
  a: int = const 1;
var cond1 defined by:
  cond1: bool = eq x one;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;
var cond0 defined by:
  cond0: bool = lt x zero;
var y defined by:
  y: int = mul a x;
var z defined by:
  z: int = mul a a;

OUTS main
block0 (main):
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var a defined by:
  a: int = const 1;

block1 (loop_cond):
var y defined by:
  y: int = mul a x;
var cond1 defined by:
  cond1: bool = eq x one;
var z defined by:
  z: int = mul a a;
var a defined by:
  a: int = const 1;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;
var cond0 defined by:
  cond0: bool = lt x zero;

block2 (body):
var z defined by:
  z: int = mul a a;
var cond1 defined by:
  cond1: bool = eq x one;
var y defined by:
  y: int = mul a x;
var cond0 defined by:
  cond0: bool = lt x zero;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var a defined by:
  a: int = const 1;

block3 (tru):
var cond1 defined by:
  cond1: bool = eq x one;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var a defined by:
  a: int = id z;
var cond0 defined by:
  cond0: bool = lt x zero;
var z defined by:
  z: int = mul a a;
var y defined by:
  y: int = mul a x;

block4 (fals):
var one defined by:
  one: int = const 1;
var cond0 defined by:
  cond0: bool = lt x zero;
var zero defined by:
  zero: int = const 0;
var y defined by:
  y: int = mul a x;
var a defined by:
  a: int = id y;
var cond1 defined by:
  cond1: bool = eq x one;
var z defined by:
  z: int = mul a a;

block5 (exit):
var zero defined by:
  zero: int = const 0;
var cond0 defined by:
  cond0: bool = lt x zero;
var y defined by:
  y: int = mul a x;
var cond1 defined by:
  cond1: bool = eq x one;
var a defined by:
  a: int = const 1;
var z defined by:
  z: int = mul a a;
var one defined by:
  one: int = const 1;

