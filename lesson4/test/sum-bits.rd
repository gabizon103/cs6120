INS main
block0 (main):

block1 (loop):
var input defined by:
  input: int = div input two;
var cond defined by:
  cond: bool = eq input zero;
var two defined by:
  two: int = const 2;
var bit defined by:
  bit: int = call @mod input two;
var zero defined by:
  zero: int = const 0;
var sum defined by:
  sum: int = const 0;

block2 (body):
var input defined by:
  input: int = div input two;
var zero defined by:
  zero: int = const 0;
var two defined by:
  two: int = const 2;
var sum defined by:
  sum: int = const 0;
var bit defined by:
  bit: int = call @mod input two;
var cond defined by:
  cond: bool = eq input zero;

block3 (done):
var two defined by:
  two: int = const 2;
var cond defined by:
  cond: bool = eq input zero;
var zero defined by:
  zero: int = const 0;
var sum defined by:
  sum: int = const 0;
var input defined by:
  input: int = div input two;
var bit defined by:
  bit: int = call @mod input two;

OUTS main
block0 (main):
var zero defined by:
  zero: int = const 0;
var two defined by:
  two: int = const 2;
var sum defined by:
  sum: int = const 0;

block1 (loop):
var zero defined by:
  zero: int = const 0;
var two defined by:
  two: int = const 2;
var cond defined by:
  cond: bool = eq input zero;
var input defined by:
  input: int = div input two;
var sum defined by:
  sum: int = const 0;
var bit defined by:
  bit: int = call @mod input two;

block2 (body):
var bit defined by:
  bit: int = call @mod input two;
var input defined by:
  input: int = div input two;
var cond defined by:
  cond: bool = eq input zero;
var zero defined by:
  zero: int = const 0;
var two defined by:
  two: int = const 2;
var sum defined by:
  sum: int = add sum bit;

block3 (done):
var input defined by:
  input: int = div input two;
var sum defined by:
  sum: int = const 0;
var cond defined by:
  cond: bool = eq input zero;
var zero defined by:
  zero: int = const 0;
var bit defined by:
  bit: int = call @mod input two;
var two defined by:
  two: int = const 2;

INS mod
block0 (mod):

OUTS mod
block0 (mod):
var two defined by:
  two: int = const 2;
var quotient defined by:
  quotient: int = div dividend divisor;
var prod defined by:
  prod: int = mul two quotient;
var diff defined by:
  diff: int = sub dividend prod;

