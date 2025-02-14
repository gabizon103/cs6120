INS ack
block0 (ack):

block1 (m_zero):
var cond_m defined by:
  cond_m: bool = eq m zero;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;

block2 (m_nonzero):
var cond_m defined by:
  cond_m: bool = eq m zero;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;

block3 (n_zero):
var cond_n defined by:
  cond_n: bool = eq n zero;
var cond_m defined by:
  cond_m: bool = eq m zero;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;

block4 (n_nonzero):
var cond_m defined by:
  cond_m: bool = eq m zero;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var cond_n defined by:
  cond_n: bool = eq n zero;

OUTS ack
block0 (ack):
var cond_m defined by:
  cond_m: bool = eq m zero;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;

block1 (m_zero):
var cond_m defined by:
  cond_m: bool = eq m zero;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;
var tmp defined by:
  tmp: int = add n one;

block2 (m_nonzero):
var cond_m defined by:
  cond_m: bool = eq m zero;
var one defined by:
  one: int = const 1;
var cond_n defined by:
  cond_n: bool = eq n zero;
var zero defined by:
  zero: int = const 0;

block3 (n_zero):
var cond_m defined by:
  cond_m: bool = eq m zero;
var one defined by:
  one: int = const 1;
var cond_n defined by:
  cond_n: bool = eq n zero;
var zero defined by:
  zero: int = const 0;
var m1 defined by:
  m1: int = sub m one;
var tmp defined by:
  tmp: int = call @ack m1 one;

block4 (n_nonzero):
var n1 defined by:
  n1: int = sub n one;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;
var m1 defined by:
  m1: int = sub m one;
var t1 defined by:
  t1: int = call @ack m n1;
var t2 defined by:
  t2: int = call @ack m1 t1;
var cond_m defined by:
  cond_m: bool = eq m zero;
var cond_n defined by:
  cond_n: bool = eq n zero;

INS main
block0 (main):

OUTS main
block0 (main):
var tmp defined by:
  tmp: int = call @ack m n;

