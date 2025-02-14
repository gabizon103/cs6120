INS main
block0 (main):

block1 (neg):
var i defined by:
  i: int = const 0;
var non defined by:
  non: int = const -1;
var res defined by:
  res: int = const 0;
var one defined by:
  one: int = const 1;
var zer defined by:
  zer: int = const 0;
var nlz defined by:
  nlz: bool = lt n zer;

block2 (begin):
var m defined by:
  m: int = call @mod n i;
var d defined by:
  d: int = div n i;
var res defined by:
  res: int = add res d;
var zer defined by:
  zer: int = const 0;
var sqgt defined by:
  sqgt: bool = gt isq n;
var n defined by:
  n: int = mul n non;
var non defined by:
  non: int = const -1;
var nlz defined by:
  nlz: bool = lt n zer;
var eqz defined by:
  eqz: bool = eq m zer;
var i defined by:
  i: int = add i one;
var isq defined by:
  isq: int = mul i i;
var one defined by:
  one: int = const 1;
var deqi defined by:
  deqi: bool = eq d i;

block3 (check):
var nlz defined by:
  nlz: bool = lt n zer;
var n defined by:
  n: int = mul n non;
var eqz defined by:
  eqz: bool = eq m zer;
var sqgt defined by:
  sqgt: bool = gt isq n;
var non defined by:
  non: int = const -1;
var i defined by:
  i: int = add i one;
var isq defined by:
  isq: int = mul i i;
var zer defined by:
  zer: int = const 0;
var deqi defined by:
  deqi: bool = eq d i;
var m defined by:
  m: int = call @mod n i;
var one defined by:
  one: int = const 1;
var res defined by:
  res: int = add res d;
var d defined by:
  d: int = div n i;

block4 (body):
var sqgt defined by:
  sqgt: bool = gt isq n;
var i defined by:
  i: int = add i one;
var isq defined by:
  isq: int = mul i i;
var non defined by:
  non: int = const -1;
var eqz defined by:
  eqz: bool = eq m zer;
var nlz defined by:
  nlz: bool = lt n zer;
var zer defined by:
  zer: int = const 0;
var deqi defined by:
  deqi: bool = eq d i;
var m defined by:
  m: int = call @mod n i;
var res defined by:
  res: int = add res d;
var d defined by:
  d: int = div n i;
var one defined by:
  one: int = const 1;
var n defined by:
  n: int = mul n non;

block5 (then):
var isq defined by:
  isq: int = mul i i;
var one defined by:
  one: int = const 1;
var non defined by:
  non: int = const -1;
var eqz defined by:
  eqz: bool = eq m zer;
var deqi defined by:
  deqi: bool = eq d i;
var zer defined by:
  zer: int = const 0;
var m defined by:
  m: int = call @mod n i;
var n defined by:
  n: int = mul n non;
var nlz defined by:
  nlz: bool = lt n zer;
var sqgt defined by:
  sqgt: bool = gt isq n;
var res defined by:
  res: int = add res i;
var i defined by:
  i: int = add i one;
var d defined by:
  d: int = div n i;

block6 (end):
var zer defined by:
  zer: int = const 0;
var nlz defined by:
  nlz: bool = lt n zer;
var eqz defined by:
  eqz: bool = eq m zer;
var n defined by:
  n: int = mul n non;
var sqgt defined by:
  sqgt: bool = gt isq n;
var one defined by:
  one: int = const 1;
var isq defined by:
  isq: int = mul i i;
var res defined by:
  res: int = add res d;
var m defined by:
  m: int = call @mod n i;
var deqi defined by:
  deqi: bool = eq d i;
var non defined by:
  non: int = const -1;
var i defined by:
  i: int = add i one;
var d defined by:
  d: int = div n i;

OUTS main
block0 (main):
var i defined by:
  i: int = const 0;
var res defined by:
  res: int = const 0;
var one defined by:
  one: int = const 1;
var non defined by:
  non: int = const -1;
var zer defined by:
  zer: int = const 0;
var nlz defined by:
  nlz: bool = lt n zer;

block1 (neg):
var nlz defined by:
  nlz: bool = lt n zer;
var i defined by:
  i: int = const 0;
var n defined by:
  n: int = mul n non;
var res defined by:
  res: int = const 0;
var one defined by:
  one: int = const 1;
var zer defined by:
  zer: int = const 0;
var non defined by:
  non: int = const -1;

block2 (begin):
var eqz defined by:
  eqz: bool = eq m zer;
var nlz defined by:
  nlz: bool = lt n zer;
var zer defined by:
  zer: int = const 0;
var d defined by:
  d: int = div n i;
var m defined by:
  m: int = call @mod n i;
var deqi defined by:
  deqi: bool = eq d i;
var n defined by:
  n: int = mul n non;
var isq defined by:
  isq: int = mul i i;
var sqgt defined by:
  sqgt: bool = gt isq n;
var one defined by:
  one: int = const 1;
var res defined by:
  res: int = add res d;
var non defined by:
  non: int = const -1;
var i defined by:
  i: int = add i one;

block3 (check):
var nlz defined by:
  nlz: bool = lt n zer;
var n defined by:
  n: int = mul n non;
var eqz defined by:
  eqz: bool = eq m zer;
var sqgt defined by:
  sqgt: bool = gt isq n;
var non defined by:
  non: int = const -1;
var i defined by:
  i: int = add i one;
var isq defined by:
  isq: int = mul i i;
var zer defined by:
  zer: int = const 0;
var deqi defined by:
  deqi: bool = eq d i;
var m defined by:
  m: int = call @mod n i;
var one defined by:
  one: int = const 1;
var res defined by:
  res: int = add res d;
var d defined by:
  d: int = div n i;

block4 (body):
var eqz defined by:
  eqz: bool = eq m zer;
var d defined by:
  d: int = div n i;
var deqi defined by:
  deqi: bool = eq d i;
var res defined by:
  res: int = add res i;
var non defined by:
  non: int = const -1;
var i defined by:
  i: int = add i one;
var one defined by:
  one: int = const 1;
var nlz defined by:
  nlz: bool = lt n zer;
var zer defined by:
  zer: int = const 0;
var m defined by:
  m: int = call @mod n i;
var n defined by:
  n: int = mul n non;
var isq defined by:
  isq: int = mul i i;
var sqgt defined by:
  sqgt: bool = gt isq n;

block5 (then):
var one defined by:
  one: int = const 1;
var deqi defined by:
  deqi: bool = eq d i;
var i defined by:
  i: int = add i one;
var nlz defined by:
  nlz: bool = lt n zer;
var d defined by:
  d: int = div n i;
var n defined by:
  n: int = mul n non;
var m defined by:
  m: int = call @mod n i;
var isq defined by:
  isq: int = mul i i;
var sqgt defined by:
  sqgt: bool = gt isq n;
var non defined by:
  non: int = const -1;
var res defined by:
  res: int = add res d;
var eqz defined by:
  eqz: bool = eq m zer;
var zer defined by:
  zer: int = const 0;

block6 (end):
var zer defined by:
  zer: int = const 0;
var nlz defined by:
  nlz: bool = lt n zer;
var eqz defined by:
  eqz: bool = eq m zer;
var n defined by:
  n: int = mul n non;
var sqgt defined by:
  sqgt: bool = gt isq n;
var one defined by:
  one: int = const 1;
var isq defined by:
  isq: int = mul i i;
var res defined by:
  res: int = add res d;
var m defined by:
  m: int = call @mod n i;
var deqi defined by:
  deqi: bool = eq d i;
var non defined by:
  non: int = const -1;
var i defined by:
  i: int = add i one;
var d defined by:
  d: int = div n i;

INS mod
block0 (mod):

OUTS mod
block0 (mod):
var quot defined by:
  quot: int = div dividend divisor;
var diff defined by:
  diff: int = sub dividend prod;
var prod defined by:
  prod: int = mul divisor quot;

