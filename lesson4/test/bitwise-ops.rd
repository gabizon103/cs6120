INS mod2
block0 (mod2):

OUTS mod2
block0 (mod2):
var one defined by:
  one: int = const 1;
var tmp defined by:
  tmp: int = div a two;
var two defined by:
  two: int = const 2;
var tmp2 defined by:
  tmp2: int = mul tmp two;
var tmp3 defined by:
  tmp3: int = sub a tmp2;
var ans defined by:
  ans: bool = eq one tmp3;

INS loop_subroutine
block0 (loop_subroutine):

block1 (loop):
var a defined by:
  a: int = div a two;
var cond_add defined by:
  cond_add: bool = or mod2a mod2b;
var i defined by:
  i: int = add i one;
var ans defined by:
  ans: int = add ans to_add;
var mod2a defined by:
  mod2a: bool = call @mod2 a;
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var cond defined by:
  cond: bool = le i n;
var b defined by:
  b: int = div b two;
var one defined by:
  one: int = const 1;
var n defined by:
  n: int = const 63;
var two defined by:
  two: int = const 2;
var to_add defined by:
  to_add: int = mul to_add two;

block2 (here):
var one defined by:
  one: int = const 1;
var n defined by:
  n: int = const 63;
var two defined by:
  two: int = const 2;
var a defined by:
  a: int = div a two;
var to_add defined by:
  to_add: int = mul to_add two;
var i defined by:
  i: int = add i one;
var ans defined by:
  ans: int = add ans to_add;
var mod2a defined by:
  mod2a: bool = call @mod2 a;
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var cond defined by:
  cond: bool = le i n;
var cond_add defined by:
  cond_add: bool = or mod2a mod2b;
var b defined by:
  b: int = div b two;

block3 (doOr):
var ans defined by:
  ans: int = add ans to_add;
var i defined by:
  i: int = add i one;
var cond defined by:
  cond: bool = le i n;
var n defined by:
  n: int = const 63;
var two defined by:
  two: int = const 2;
var one defined by:
  one: int = const 1;
var b defined by:
  b: int = div b two;
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var mod2a defined by:
  mod2a: bool = call @mod2 a;
var a defined by:
  a: int = div a two;
var cond_add defined by:
  cond_add: bool = and mod2a mod2b;
var to_add defined by:
  to_add: int = mul to_add two;

block4 (stay):
var cond defined by:
  cond: bool = le i n;
var two defined by:
  two: int = const 2;
var cond_add defined by:
  cond_add: bool = or mod2a mod2b;
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var b defined by:
  b: int = div b two;
var i defined by:
  i: int = add i one;
var ans defined by:
  ans: int = add ans to_add;
var to_add defined by:
  to_add: int = mul to_add two;
var a defined by:
  a: int = div a two;
var one defined by:
  one: int = const 1;
var n defined by:
  n: int = const 63;
var mod2a defined by:
  mod2a: bool = call @mod2 a;

block5 (add):
var mod2a defined by:
  mod2a: bool = call @mod2 a;
var to_add defined by:
  to_add: int = mul to_add two;
var a defined by:
  a: int = div a two;
var i defined by:
  i: int = add i one;
var n defined by:
  n: int = const 63;
var b defined by:
  b: int = div b two;
var ans defined by:
  ans: int = add ans to_add;
var cond defined by:
  cond: bool = le i n;
var two defined by:
  two: int = const 2;
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var cond_add defined by:
  cond_add: bool = or mod2a mod2b;
var one defined by:
  one: int = const 1;

block6 (end_loop):
var cond_add defined by:
  cond_add: bool = or mod2a mod2b;
var a defined by:
  a: int = div a two;
var ans defined by:
  ans: int = add ans to_add;
var one defined by:
  one: int = const 1;
var cond defined by:
  cond: bool = le i n;
var n defined by:
  n: int = const 63;
var mod2a defined by:
  mod2a: bool = call @mod2 a;
var two defined by:
  two: int = const 2;
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var b defined by:
  b: int = div b two;
var to_add defined by:
  to_add: int = mul to_add two;
var i defined by:
  i: int = add i one;

block7 (end):
var to_add defined by:
  to_add: int = mul to_add two;
var cond defined by:
  cond: bool = le i n;
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var mod2a defined by:
  mod2a: bool = call @mod2 a;
var cond_add defined by:
  cond_add: bool = or mod2a mod2b;
var ans defined by:
  ans: int = add ans to_add;
var two defined by:
  two: int = const 2;
var b defined by:
  b: int = div b two;
var one defined by:
  one: int = const 1;
var i defined by:
  i: int = add i one;
var a defined by:
  a: int = div a two;
var n defined by:
  n: int = const 63;

OUTS loop_subroutine
block0 (loop_subroutine):
var one defined by:
  one: int = const 1;
var n defined by:
  n: int = const 63;
var two defined by:
  two: int = const 2;
var i defined by:
  i: int = const 0;
var ans defined by:
  ans: int = const 0;
var to_add defined by:
  to_add: int = const 1;

block1 (loop):
var a defined by:
  a: int = div a two;
var cond_add defined by:
  cond_add: bool = or mod2a mod2b;
var i defined by:
  i: int = add i one;
var ans defined by:
  ans: int = add ans to_add;
var mod2a defined by:
  mod2a: bool = call @mod2 a;
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var cond defined by:
  cond: bool = le i n;
var b defined by:
  b: int = div b two;
var one defined by:
  one: int = const 1;
var n defined by:
  n: int = const 63;
var two defined by:
  two: int = const 2;
var to_add defined by:
  to_add: int = mul to_add two;

block2 (here):
var mod2a defined by:
  mod2a: bool = call @mod2 a;
var a defined by:
  a: int = div a two;
var cond defined by:
  cond: bool = le i n;
var cond_add defined by:
  cond_add: bool = and mod2a mod2b;
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var b defined by:
  b: int = div b two;
var two defined by:
  two: int = const 2;
var n defined by:
  n: int = const 63;
var i defined by:
  i: int = add i one;
var one defined by:
  one: int = const 1;
var to_add defined by:
  to_add: int = mul to_add two;
var ans defined by:
  ans: int = add ans to_add;

block3 (doOr):
var n defined by:
  n: int = const 63;
var cond defined by:
  cond: bool = le i n;
var a defined by:
  a: int = div a two;
var two defined by:
  two: int = const 2;
var i defined by:
  i: int = add i one;
var ans defined by:
  ans: int = add ans to_add;
var b defined by:
  b: int = div b two;
var cond_add defined by:
  cond_add: bool = or mod2a mod2b;
var one defined by:
  one: int = const 1;
var mod2a defined by:
  mod2a: bool = call @mod2 a;
var to_add defined by:
  to_add: int = mul to_add two;
var mod2b defined by:
  mod2b: bool = call @mod2 b;

block4 (stay):
var cond defined by:
  cond: bool = le i n;
var two defined by:
  two: int = const 2;
var cond_add defined by:
  cond_add: bool = or mod2a mod2b;
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var b defined by:
  b: int = div b two;
var i defined by:
  i: int = add i one;
var ans defined by:
  ans: int = add ans to_add;
var to_add defined by:
  to_add: int = mul to_add two;
var a defined by:
  a: int = div a two;
var one defined by:
  one: int = const 1;
var n defined by:
  n: int = const 63;
var mod2a defined by:
  mod2a: bool = call @mod2 a;

block5 (add):
var one defined by:
  one: int = const 1;
var i defined by:
  i: int = add i one;
var a defined by:
  a: int = div a two;
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var cond_add defined by:
  cond_add: bool = or mod2a mod2b;
var to_add defined by:
  to_add: int = mul to_add two;
var b defined by:
  b: int = div b two;
var n defined by:
  n: int = const 63;
var cond defined by:
  cond: bool = le i n;
var two defined by:
  two: int = const 2;
var ans defined by:
  ans: int = add ans to_add;
var mod2a defined by:
  mod2a: bool = call @mod2 a;

block6 (end_loop):
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var a defined by:
  a: int = div a two;
var two defined by:
  two: int = const 2;
var one defined by:
  one: int = const 1;
var to_add defined by:
  to_add: int = mul to_add two;
var ans defined by:
  ans: int = add ans to_add;
var n defined by:
  n: int = const 63;
var i defined by:
  i: int = add i one;
var cond_add defined by:
  cond_add: bool = or mod2a mod2b;
var b defined by:
  b: int = div b two;
var cond defined by:
  cond: bool = le i n;
var mod2a defined by:
  mod2a: bool = call @mod2 a;

block7 (end):
var to_add defined by:
  to_add: int = mul to_add two;
var cond defined by:
  cond: bool = le i n;
var mod2b defined by:
  mod2b: bool = call @mod2 b;
var mod2a defined by:
  mod2a: bool = call @mod2 a;
var cond_add defined by:
  cond_add: bool = or mod2a mod2b;
var ans defined by:
  ans: int = add ans to_add;
var two defined by:
  two: int = const 2;
var b defined by:
  b: int = div b two;
var one defined by:
  one: int = const 1;
var i defined by:
  i: int = add i one;
var a defined by:
  a: int = div a two;
var n defined by:
  n: int = const 63;

INS OR
block0 (OR):

OUTS OR
block0 (OR):
var oper defined by:
  oper: bool = const true;
var v1 defined by:
  v1: int = call @loop_subroutine a b oper;

INS AND
block0 (AND):

OUTS AND
block0 (AND):
var v1 defined by:
  v1: int = call @loop_subroutine a b oper;
var oper defined by:
  oper: bool = const false;

INS XOR
block0 (XOR):

OUTS XOR
block0 (XOR):
var ans defined by:
  ans: int = sub or_val and_val;
var or_val defined by:
  or_val: int = call @OR a b;
var and_val defined by:
  and_val: int = call @AND a b;

INS main
block0 (main):

block1 (useless_lbl):
var equal defined by:
  equal: bool = eq sel zero;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var ans defined by:
  ans: int = id zero;
var greater defined by:
  greater: bool = gt sel zero;
var sel defined by:
  sel: int = sub c one;
var less defined by:
  less: bool = lt sel zero;

block2 (and_op):
var equal defined by:
  equal: bool = eq sel zero;
var one defined by:
  one: int = const 1;
var sel defined by:
  sel: int = sub c one;
var ans defined by:
  ans: int = id zero;
var less defined by:
  less: bool = lt sel zero;
var greater defined by:
  greater: bool = gt sel zero;
var zero defined by:
  zero: int = const 0;

block3 (or_op):
var sel defined by:
  sel: int = sub c one;
var zero defined by:
  zero: int = const 0;
var less defined by:
  less: bool = lt sel zero;
var one defined by:
  one: int = const 1;
var ans defined by:
  ans: int = id zero;
var greater defined by:
  greater: bool = gt sel zero;
var equal defined by:
  equal: bool = eq sel zero;

block4 (xor_op):
var zero defined by:
  zero: int = const 0;
var equal defined by:
  equal: bool = eq sel zero;
var greater defined by:
  greater: bool = gt sel zero;
var one defined by:
  one: int = const 1;
var ans defined by:
  ans: int = id zero;
var less defined by:
  less: bool = lt sel zero;
var sel defined by:
  sel: int = sub c one;

block5 (end):
var sel defined by:
  sel: int = sub c one;
var zero defined by:
  zero: int = const 0;
var less defined by:
  less: bool = lt sel zero;
var one defined by:
  one: int = const 1;
var greater defined by:
  greater: bool = gt sel zero;
var ans defined by:
  ans: int = call @OR a b;
var equal defined by:
  equal: bool = eq sel zero;

OUTS main
block0 (main):
var less defined by:
  less: bool = lt sel zero;
var greater defined by:
  greater: bool = gt sel zero;
var zero defined by:
  zero: int = const 0;
var sel defined by:
  sel: int = sub c one;
var equal defined by:
  equal: bool = eq sel zero;
var ans defined by:
  ans: int = id zero;
var one defined by:
  one: int = const 1;

block1 (useless_lbl):
var greater defined by:
  greater: bool = gt sel zero;
var sel defined by:
  sel: int = sub c one;
var equal defined by:
  equal: bool = eq sel zero;
var one defined by:
  one: int = const 1;
var ans defined by:
  ans: int = id zero;
var less defined by:
  less: bool = lt sel zero;
var zero defined by:
  zero: int = const 0;

block2 (and_op):
var less defined by:
  less: bool = lt sel zero;
var greater defined by:
  greater: bool = gt sel zero;
var ans defined by:
  ans: int = call @AND a b;
var zero defined by:
  zero: int = const 0;
var equal defined by:
  equal: bool = eq sel zero;
var one defined by:
  one: int = const 1;
var sel defined by:
  sel: int = sub c one;

block3 (or_op):
var one defined by:
  one: int = const 1;
var less defined by:
  less: bool = lt sel zero;
var equal defined by:
  equal: bool = eq sel zero;
var ans defined by:
  ans: int = call @OR a b;
var greater defined by:
  greater: bool = gt sel zero;
var zero defined by:
  zero: int = const 0;
var sel defined by:
  sel: int = sub c one;

block4 (xor_op):
var less defined by:
  less: bool = lt sel zero;
var greater defined by:
  greater: bool = gt sel zero;
var sel defined by:
  sel: int = sub c one;
var equal defined by:
  equal: bool = eq sel zero;
var ans defined by:
  ans: int = call @XOR a b;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;

block5 (end):
var zero defined by:
  zero: int = const 0;
var equal defined by:
  equal: bool = eq sel zero;
var less defined by:
  less: bool = lt sel zero;
var one defined by:
  one: int = const 1;
var sel defined by:
  sel: int = sub c one;
var ans defined by:
  ans: int = call @OR a b;
var greater defined by:
  greater: bool = gt sel zero;

