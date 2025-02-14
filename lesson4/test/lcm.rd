INS main
block0 (main):

block1 (then.1):
var v4 defined by:
  v4: bool = gt x y;
var greater defined by:
  greater: int = id y;

block2 (else.1):
var v4 defined by:
  v4: bool = gt x y;
var greater defined by:
  greater: int = id y;

block3 (endif.1):
var greater defined by:
  greater: int = id x;
var v4 defined by:
  v4: bool = gt x y;

block4 (foreverloop):
var yZero defined by:
  yZero: bool = eq modY zero;
var greater defined by:
  greater: int = add greater one;
var modX defined by:
  modX: int = call @getMod greater x;
var modY defined by:
  modY: int = call @getMod greater y;
var zero defined by:
  zero: int = const 0;
var bothZero defined by:
  bothZero: bool = and xZero yZero;
var xZero defined by:
  xZero: bool = eq modX zero;
var one defined by:
  one: int = const 1;

block5 (then.2):
var zero defined by:
  zero: int = const 0;
var modX defined by:
  modX: int = call @getMod greater x;
var yZero defined by:
  yZero: bool = eq modY zero;
var bothZero defined by:
  bothZero: bool = and xZero yZero;
var greater defined by:
  greater: int = add greater one;
var modY defined by:
  modY: int = call @getMod greater y;
var xZero defined by:
  xZero: bool = eq modX zero;
var one defined by:
  one: int = const 1;

block6 (else.2):
var one defined by:
  one: int = const 1;
var bothZero defined by:
  bothZero: bool = and xZero yZero;
var yZero defined by:
  yZero: bool = eq modY zero;
var zero defined by:
  zero: int = const 0;
var xZero defined by:
  xZero: bool = eq modX zero;
var modY defined by:
  modY: int = call @getMod greater y;
var modX defined by:
  modX: int = call @getMod greater x;
var greater defined by:
  greater: int = add greater one;

block7 (loopend):
var zero defined by:
  zero: int = const 0;
var greater defined by:
  greater: int = add greater one;
var modX defined by:
  modX: int = call @getMod greater x;
var one defined by:
  one: int = const 1;
var bothZero defined by:
  bothZero: bool = and xZero yZero;
var yZero defined by:
  yZero: bool = eq modY zero;
var modY defined by:
  modY: int = call @getMod greater y;
var xZero defined by:
  xZero: bool = eq modX zero;

OUTS main
block0 (main):
var v4 defined by:
  v4: bool = gt x y;
var greater defined by:
  greater: int = id y;

block1 (then.1):
var greater defined by:
  greater: int = id x;
var v4 defined by:
  v4: bool = gt x y;

block2 (else.1):
var v4 defined by:
  v4: bool = gt x y;
var greater defined by:
  greater: int = id y;

block3 (endif.1):
var greater defined by:
  greater: int = id x;
var v4 defined by:
  v4: bool = gt x y;

block4 (foreverloop):
var yZero defined by:
  yZero: bool = eq modY zero;
var greater defined by:
  greater: int = add greater one;
var modX defined by:
  modX: int = call @getMod greater x;
var modY defined by:
  modY: int = call @getMod greater y;
var zero defined by:
  zero: int = const 0;
var bothZero defined by:
  bothZero: bool = and xZero yZero;
var xZero defined by:
  xZero: bool = eq modX zero;
var one defined by:
  one: int = const 1;

block5 (then.2):
var zero defined by:
  zero: int = const 0;
var modX defined by:
  modX: int = call @getMod greater x;
var yZero defined by:
  yZero: bool = eq modY zero;
var bothZero defined by:
  bothZero: bool = and xZero yZero;
var greater defined by:
  greater: int = add greater one;
var modY defined by:
  modY: int = call @getMod greater y;
var xZero defined by:
  xZero: bool = eq modX zero;
var one defined by:
  one: int = const 1;

block6 (else.2):
var modX defined by:
  modX: int = call @getMod greater x;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;
var bothZero defined by:
  bothZero: bool = and xZero yZero;
var xZero defined by:
  xZero: bool = eq modX zero;
var yZero defined by:
  yZero: bool = eq modY zero;
var greater defined by:
  greater: int = add greater one;
var modY defined by:
  modY: int = call @getMod greater y;

block7 (loopend):
var zero defined by:
  zero: int = const 0;
var greater defined by:
  greater: int = add greater one;
var modX defined by:
  modX: int = call @getMod greater x;
var one defined by:
  one: int = const 1;
var bothZero defined by:
  bothZero: bool = and xZero yZero;
var yZero defined by:
  yZero: bool = eq modY zero;
var modY defined by:
  modY: int = call @getMod greater y;
var xZero defined by:
  xZero: bool = eq modX zero;

INS getMod
block0 (getMod):

OUTS getMod
block0 (getMod):
var divisor defined by:
  divisor: int = div val mod;
var rem defined by:
  rem: int = sub val multiple;
var multiple defined by:
  multiple: int = mul divisor mod;

