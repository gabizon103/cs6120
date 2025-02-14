INS main
block0 (main):

OUTS main
block0 (main):
var catn defined by:
  catn: int = call @catalan input;

INS catalan
block0 (catalan):

block1 (if):
var guard0 defined by:
  guard0: bool = eq n zero;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;

block2 (else):
var guard0 defined by:
  guard0: bool = eq n zero;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;

block3 (while):
var sum defined by:
  sum: int = add sum elti;
var n defined by:
  n: int = sub n one;
var one defined by:
  one: int = const 1;
var elti defined by:
  elti: int = mul v1 v2;
var guard0 defined by:
  guard0: bool = eq n zero;
var idx defined by:
  idx: int = add idx one;
var v2 defined by:
  v2: int = call @catalan n2;
var n2 defined by:
  n2: int = sub n idx;
var v1 defined by:
  v1: int = call @catalan idx;
var guard1 defined by:
  guard1: bool = le idx n;
var zero defined by:
  zero: int = const 0;

block4 (while.body):
var n defined by:
  n: int = sub n one;
var v2 defined by:
  v2: int = call @catalan n2;
var n2 defined by:
  n2: int = sub n idx;
var guard0 defined by:
  guard0: bool = eq n zero;
var elti defined by:
  elti: int = mul v1 v2;
var v1 defined by:
  v1: int = call @catalan idx;
var idx defined by:
  idx: int = add idx one;
var guard1 defined by:
  guard1: bool = le idx n;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var sum defined by:
  sum: int = add sum elti;

block5 (while.end):
var v1 defined by:
  v1: int = call @catalan idx;
var sum defined by:
  sum: int = add sum elti;
var elti defined by:
  elti: int = mul v1 v2;
var guard0 defined by:
  guard0: bool = eq n zero;
var zero defined by:
  zero: int = const 0;
var v2 defined by:
  v2: int = call @catalan n2;
var n defined by:
  n: int = sub n one;
var idx defined by:
  idx: int = add idx one;
var n2 defined by:
  n2: int = sub n idx;
var one defined by:
  one: int = const 1;
var guard1 defined by:
  guard1: bool = le idx n;

OUTS catalan
block0 (catalan):
var guard0 defined by:
  guard0: bool = eq n zero;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;

block1 (if):
var guard0 defined by:
  guard0: bool = eq n zero;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;

block2 (else):
var guard0 defined by:
  guard0: bool = eq n zero;
var one defined by:
  one: int = const 1;
var idx defined by:
  idx: int = id zero;
var zero defined by:
  zero: int = const 0;
var sum defined by:
  sum: int = id zero;
var n defined by:
  n: int = sub n one;

block3 (while):
var sum defined by:
  sum: int = add sum elti;
var n defined by:
  n: int = sub n one;
var one defined by:
  one: int = const 1;
var elti defined by:
  elti: int = mul v1 v2;
var guard0 defined by:
  guard0: bool = eq n zero;
var idx defined by:
  idx: int = add idx one;
var v2 defined by:
  v2: int = call @catalan n2;
var n2 defined by:
  n2: int = sub n idx;
var v1 defined by:
  v1: int = call @catalan idx;
var guard1 defined by:
  guard1: bool = le idx n;
var zero defined by:
  zero: int = const 0;

block4 (while.body):
var one defined by:
  one: int = const 1;
var elti defined by:
  elti: int = mul v1 v2;
var n defined by:
  n: int = sub n one;
var idx defined by:
  idx: int = add idx one;
var guard1 defined by:
  guard1: bool = le idx n;
var zero defined by:
  zero: int = const 0;
var v2 defined by:
  v2: int = call @catalan n2;
var guard0 defined by:
  guard0: bool = eq n zero;
var sum defined by:
  sum: int = add sum elti;
var n2 defined by:
  n2: int = sub n idx;
var v1 defined by:
  v1: int = call @catalan idx;

block5 (while.end):
var v1 defined by:
  v1: int = call @catalan idx;
var v2 defined by:
  v2: int = call @catalan n2;
var elti defined by:
  elti: int = mul v1 v2;
var n defined by:
  n: int = sub n one;
var guard1 defined by:
  guard1: bool = le idx n;
var sum defined by:
  sum: int = add sum elti;
var n2 defined by:
  n2: int = sub n idx;
var zero defined by:
  zero: int = const 0;
var idx defined by:
  idx: int = add idx one;
var one defined by:
  one: int = const 1;
var guard0 defined by:
  guard0: bool = eq n zero;

