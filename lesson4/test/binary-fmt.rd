INS main
block0 (main):

OUTS main
block0 (main):

INS printBinary
block0 (printBinary):

block1 (rec):
var zero defined by:
  zero: int = const 0;
var cond defined by:
  cond: bool = eq n zero;

block2 (end):
var cond defined by:
  cond: bool = eq n zero;
var two defined by:
  two: int = const 2;
var v1 defined by:
  v1: int = div n two;
var zero defined by:
  zero: int = const 0;
var v0 defined by:
  v0: int = call @mod n two;

OUTS printBinary
block0 (printBinary):
var zero defined by:
  zero: int = const 0;
var cond defined by:
  cond: bool = eq n zero;

block1 (rec):
var zero defined by:
  zero: int = const 0;
var two defined by:
  two: int = const 2;
var cond defined by:
  cond: bool = eq n zero;
var v1 defined by:
  v1: int = div n two;
var v0 defined by:
  v0: int = call @mod n two;

block2 (end):
var v1 defined by:
  v1: int = div n two;
var cond defined by:
  cond: bool = eq n zero;
var v0 defined by:
  v0: int = call @mod n two;
var two defined by:
  two: int = const 2;
var zero defined by:
  zero: int = const 0;

INS mod
block0 (mod):

OUTS mod
block0 (mod):
var v2 defined by:
  v2: int = sub a0 v1;
var v0 defined by:
  v0: int = div a0 a1;
var v1 defined by:
  v1: int = mul v0 a1;

