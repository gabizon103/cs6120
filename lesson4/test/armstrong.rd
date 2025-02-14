INS main
block0 (main):

block1 (loop):
var pow defined by:
  pow: int = call @power digit digits;
var ten defined by:
  ten: int = const 10;
var digits defined by:
  digits: int = call @getDigits input;
var tmp defined by:
  tmp: int = id input;
var digit defined by:
  digit: int = call @mod tmp ten;
var b defined by:
  b: bool = gt tmp zero;
var sum defined by:
  sum: int = const 0;
var zero defined by:
  zero: int = const 0;

block2 (body):
var sum defined by:
  sum: int = const 0;
var digit defined by:
  digit: int = call @mod tmp ten;
var digits defined by:
  digits: int = call @getDigits input;
var zero defined by:
  zero: int = const 0;
var tmp defined by:
  tmp: int = id input;
var b defined by:
  b: bool = gt tmp zero;
var ten defined by:
  ten: int = const 10;
var pow defined by:
  pow: int = call @power digit digits;

block3 (done):
var tmp defined by:
  tmp: int = id input;
var digits defined by:
  digits: int = call @getDigits input;
var digit defined by:
  digit: int = call @mod tmp ten;
var sum defined by:
  sum: int = const 0;
var zero defined by:
  zero: int = const 0;
var ten defined by:
  ten: int = const 10;
var b defined by:
  b: bool = gt tmp zero;
var pow defined by:
  pow: int = call @power digit digits;

OUTS main
block0 (main):
var zero defined by:
  zero: int = const 0;
var digits defined by:
  digits: int = call @getDigits input;
var tmp defined by:
  tmp: int = id input;
var ten defined by:
  ten: int = const 10;
var sum defined by:
  sum: int = const 0;

block1 (loop):
var pow defined by:
  pow: int = call @power digit digits;
var ten defined by:
  ten: int = const 10;
var digits defined by:
  digits: int = call @getDigits input;
var tmp defined by:
  tmp: int = id input;
var digit defined by:
  digit: int = call @mod tmp ten;
var b defined by:
  b: bool = gt tmp zero;
var sum defined by:
  sum: int = const 0;
var zero defined by:
  zero: int = const 0;

block2 (body):
var digit defined by:
  digit: int = call @mod tmp ten;
var sum defined by:
  sum: int = add sum pow;
var zero defined by:
  zero: int = const 0;
var ten defined by:
  ten: int = const 10;
var b defined by:
  b: bool = gt tmp zero;
var digits defined by:
  digits: int = call @getDigits input;
var tmp defined by:
  tmp: int = div tmp ten;
var pow defined by:
  pow: int = call @power digit digits;

block3 (done):
var ten defined by:
  ten: int = const 10;
var digit defined by:
  digit: int = call @mod tmp ten;
var sum defined by:
  sum: int = const 0;
var digits defined by:
  digits: int = call @getDigits input;
var zero defined by:
  zero: int = const 0;
var tmp defined by:
  tmp: int = id input;
var res defined by:
  res: bool = eq input sum;
var pow defined by:
  pow: int = call @power digit digits;
var b defined by:
  b: bool = gt tmp zero;

INS getDigits
block0 (getDigits):

block1 (then):
var cond defined by:
  cond: bool = eq div zero;
var ten defined by:
  ten: int = const 10;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var div defined by:
  div: int = div n ten;

block2 (else):
var div defined by:
  div: int = div n ten;
var ten defined by:
  ten: int = const 10;
var one defined by:
  one: int = const 1;
var cond defined by:
  cond: bool = eq div zero;
var zero defined by:
  zero: int = const 0;

OUTS getDigits
block0 (getDigits):
var one defined by:
  one: int = const 1;
var cond defined by:
  cond: bool = eq div zero;
var ten defined by:
  ten: int = const 10;
var zero defined by:
  zero: int = const 0;
var div defined by:
  div: int = div n ten;

block1 (then):
var ten defined by:
  ten: int = const 10;
var one defined by:
  one: int = const 1;
var div defined by:
  div: int = div n ten;
var zero defined by:
  zero: int = const 0;
var cond defined by:
  cond: bool = eq div zero;

block2 (else):
var div defined by:
  div: int = div n ten;
var zero defined by:
  zero: int = const 0;
var rec defined by:
  rec: int = call @getDigits div;
var res defined by:
  res: int = add rec one;
var one defined by:
  one: int = const 1;
var cond defined by:
  cond: bool = eq div zero;
var ten defined by:
  ten: int = const 10;

INS mod
block0 (mod):

OUTS mod
block0 (mod):
var q defined by:
  q: int = div a b;
var aq defined by:
  aq: int = mul b q;
var mod defined by:
  mod: int = sub a aq;

INS power
block0 (power):

block1 (loop):
var ten defined by:
  ten: int = const 10;
var res defined by:
  res: int = mul res base;
var b defined by:
  b: bool = eq exp zero;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var exp defined by:
  exp: int = sub exp one;

block2 (body):
var b defined by:
  b: bool = eq exp zero;
var res defined by:
  res: int = mul res base;
var exp defined by:
  exp: int = sub exp one;
var ten defined by:
  ten: int = const 10;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;

block3 (done):
var exp defined by:
  exp: int = sub exp one;
var one defined by:
  one: int = const 1;
var b defined by:
  b: bool = eq exp zero;
var zero defined by:
  zero: int = const 0;
var res defined by:
  res: int = mul res base;
var ten defined by:
  ten: int = const 10;

OUTS power
block0 (power):
var one defined by:
  one: int = const 1;
var res defined by:
  res: int = const 1;
var ten defined by:
  ten: int = const 10;
var zero defined by:
  zero: int = const 0;

block1 (loop):
var ten defined by:
  ten: int = const 10;
var res defined by:
  res: int = mul res base;
var b defined by:
  b: bool = eq exp zero;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var exp defined by:
  exp: int = sub exp one;

block2 (body):
var exp defined by:
  exp: int = sub exp one;
var ten defined by:
  ten: int = const 10;
var zero defined by:
  zero: int = const 0;
var b defined by:
  b: bool = eq exp zero;
var one defined by:
  one: int = const 1;
var res defined by:
  res: int = mul res base;

block3 (done):
var ten defined by:
  ten: int = const 10;
var one defined by:
  one: int = const 1;
var b defined by:
  b: bool = eq exp zero;
var exp defined by:
  exp: int = sub exp one;
var zero defined by:
  zero: int = const 0;
var res defined by:
  res: int = mul res base;

