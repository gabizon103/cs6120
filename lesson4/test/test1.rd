INS main
block0 (main):

block1 (t):
var a defined by:
  a: int = const 5;
var zero defined by:
  zero: int = const 0;
var cond defined by:
  cond: bool = eq a zero;

block2 (f):
var a defined by:
  a: int = const 5;
var zero defined by:
  zero: int = const 0;
var cond defined by:
  cond: bool = eq a zero;

block3 (end):
var a defined by:
  a: int = const 9;
var zero defined by:
  zero: int = const 0;
var cond defined by:
  cond: bool = eq a zero;

OUTS main
block0 (main):
var cond defined by:
  cond: bool = eq a zero;
var a defined by:
  a: int = const 5;
var zero defined by:
  zero: int = const 0;

block1 (t):
var zero defined by:
  zero: int = const 0;
var cond defined by:
  cond: bool = eq a zero;
var a defined by:
  a: int = const 7;

block2 (f):
var cond defined by:
  cond: bool = eq a zero;
var zero defined by:
  zero: int = const 0;
var a defined by:
  a: int = const 9;

block3 (end):
var a defined by:
  a: int = const 9;
var zero defined by:
  zero: int = const 0;
var cond defined by:
  cond: bool = eq a zero;

