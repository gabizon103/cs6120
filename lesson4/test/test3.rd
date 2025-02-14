INS main
block0 (main):

block1 (loop_cond):
var ten defined by:
  ten: int = const 10;
var a defined by:
  a: int = const 47;
var one defined by:
  one: int = const 1;
var cond defined by:
  cond: bool = lt i ten;
var i defined by:
  i: int = add i one;

block2 (loop_body):
var ten defined by:
  ten: int = const 10;
var one defined by:
  one: int = const 1;
var a defined by:
  a: int = const 47;
var i defined by:
  i: int = add i one;
var cond defined by:
  cond: bool = lt i ten;

block3 (loop_end):
var a defined by:
  a: int = const 47;
var one defined by:
  one: int = const 1;
var cond defined by:
  cond: bool = lt i ten;
var ten defined by:
  ten: int = const 10;
var i defined by:
  i: int = add i one;

OUTS main
block0 (main):
var one defined by:
  one: int = const 1;
var ten defined by:
  ten: int = const 10;
var i defined by:
  i: int = const 0;
var a defined by:
  a: int = const 47;

block1 (loop_cond):
var ten defined by:
  ten: int = const 10;
var a defined by:
  a: int = const 47;
var one defined by:
  one: int = const 1;
var cond defined by:
  cond: bool = lt i ten;
var i defined by:
  i: int = add i one;

block2 (loop_body):
var ten defined by:
  ten: int = const 10;
var cond defined by:
  cond: bool = lt i ten;
var a defined by:
  a: int = const 47;
var one defined by:
  one: int = const 1;
var i defined by:
  i: int = add i one;

block3 (loop_end):
var a defined by:
  a: int = const 47;
var one defined by:
  one: int = const 1;
var cond defined by:
  cond: bool = lt i ten;
var ten defined by:
  ten: int = const 10;
var i defined by:
  i: int = add i one;

