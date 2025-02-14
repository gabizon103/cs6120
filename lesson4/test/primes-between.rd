INS main
block0 (main):

block1 (for.outer.init):

block2 (true):
var t1 defined by:
  t1: bool = lt a t0;
var t0 defined by:
  t0: int = const 2;

block3 (false):
var t0 defined by:
  t0: int = const 2;
var t1 defined by:
  t1: bool = lt a t0;

block4 (for.outer.cond):
var t0 defined by:
  t0: int = const 2;
var t11 defined by:
  t11: int = const 0;
var t4 defined by:
  t4: int = const 1;
var t3 defined by:
  t3: bool = le t2 b;
var t1 defined by:
  t1: bool = lt a t0;
var t5 defined by:
  t5: bool = eq t4 t4;
var t15 defined by:
  t15: int = const 1;
var t12 defined by:
  t12: bool = eq t10 t11;
var t17 defined by:
  t17: int = const 1;
var t6 defined by:
  t6: int = add t6 t16;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t13 defined by:
  t13: int = const 1;
var t2 defined by:
  t2: int = id a;
var t7 defined by:
  t7: int = const 2;
var t16 defined by:
  t16: int = const 1;
var t8 defined by:
  t8: int = div t2 t7;
var t9 defined by:
  t9: bool = le t6 t8;
var t14 defined by:
  t14: int = const 2;

block5 (for.outer.body):
var t16 defined by:
  t16: int = const 1;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t0 defined by:
  t0: int = const 2;
var t17 defined by:
  t17: int = const 1;
var t2 defined by:
  t2: int = id a;
var t3 defined by:
  t3: bool = le t2 b;
var t11 defined by:
  t11: int = const 0;
var t12 defined by:
  t12: bool = eq t10 t11;
var t9 defined by:
  t9: bool = le t6 t8;
var t8 defined by:
  t8: int = div t2 t7;
var t15 defined by:
  t15: int = const 1;
var t4 defined by:
  t4: int = const 1;
var t6 defined by:
  t6: int = add t6 t16;
var t1 defined by:
  t1: bool = lt a t0;
var t7 defined by:
  t7: int = const 2;
var t14 defined by:
  t14: int = const 2;
var t13 defined by:
  t13: int = const 1;
var t5 defined by:
  t5: bool = eq t4 t4;

block6 (for.inner.init):
var t5 defined by:
  t5: bool = eq t4 t4;
var t1 defined by:
  t1: bool = lt a t0;
var t8 defined by:
  t8: int = div t2 t7;
var t3 defined by:
  t3: bool = le t2 b;
var t17 defined by:
  t17: int = const 1;
var t9 defined by:
  t9: bool = le t6 t8;
var t13 defined by:
  t13: int = const 1;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t6 defined by:
  t6: int = add t6 t16;
var t2 defined by:
  t2: int = id a;
var t12 defined by:
  t12: bool = eq t10 t11;
var t7 defined by:
  t7: int = const 2;
var t0 defined by:
  t0: int = const 2;
var t11 defined by:
  t11: int = const 0;
var t4 defined by:
  t4: int = const 1;
var t14 defined by:
  t14: int = const 2;
var t16 defined by:
  t16: int = const 1;
var t15 defined by:
  t15: int = const 1;

block7 (for.inner.cond):
var t2 defined by:
  t2: int = id a;
var t12 defined by:
  t12: bool = eq t10 t11;
var t17 defined by:
  t17: int = const 1;
var t16 defined by:
  t16: int = const 1;
var t15 defined by:
  t15: int = const 1;
var t9 defined by:
  t9: bool = le t6 t8;
var t3 defined by:
  t3: bool = le t2 b;
var t1 defined by:
  t1: bool = lt a t0;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t13 defined by:
  t13: int = const 1;
var t4 defined by:
  t4: int = const 1;
var t0 defined by:
  t0: int = const 2;
var t5 defined by:
  t5: bool = eq t4 t4;
var t8 defined by:
  t8: int = div t2 t7;
var t6 defined by:
  t6: int = add t15 t6;
var t7 defined by:
  t7: int = const 2;
var t14 defined by:
  t14: int = const 2;
var t11 defined by:
  t11: int = const 0;

block8 (for.inner.body):
var t5 defined by:
  t5: bool = eq t4 t4;
var t12 defined by:
  t12: bool = eq t10 t11;
var t2 defined by:
  t2: int = id a;
var t8 defined by:
  t8: int = div t2 t7;
var t9 defined by:
  t9: bool = le t6 t8;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t15 defined by:
  t15: int = const 1;
var t3 defined by:
  t3: bool = le t2 b;
var t14 defined by:
  t14: int = const 2;
var t1 defined by:
  t1: bool = lt a t0;
var t6 defined by:
  t6: int = add t15 t6;
var t4 defined by:
  t4: int = const 1;
var t13 defined by:
  t13: int = const 1;
var t7 defined by:
  t7: int = const 2;
var t11 defined by:
  t11: int = const 0;
var t0 defined by:
  t0: int = const 2;
var t16 defined by:
  t16: int = const 1;
var t17 defined by:
  t17: int = const 1;

block9 (if.inner.body):
var t1 defined by:
  t1: bool = lt a t0;
var t9 defined by:
  t9: bool = le t6 t8;
var t15 defined by:
  t15: int = const 1;
var t6 defined by:
  t6: int = add t15 t6;
var t17 defined by:
  t17: int = const 1;
var t11 defined by:
  t11: int = const 0;
var t5 defined by:
  t5: bool = eq t4 t4;
var t14 defined by:
  t14: int = const 2;
var t13 defined by:
  t13: int = const 1;
var t12 defined by:
  t12: bool = eq t10 t11;
var t2 defined by:
  t2: int = id a;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t8 defined by:
  t8: int = div t2 t7;
var t0 defined by:
  t0: int = const 2;
var t4 defined by:
  t4: int = const 1;
var t16 defined by:
  t16: int = const 1;
var t7 defined by:
  t7: int = const 2;
var t3 defined by:
  t3: bool = le t2 b;

block10 (if.inner.end):
var t2 defined by:
  t2: int = id a;
var t6 defined by:
  t6: int = add t15 t6;
var t1 defined by:
  t1: bool = lt a t0;
var t12 defined by:
  t12: bool = eq t10 t11;
var t5 defined by:
  t5: bool = eq t4 t4;
var t8 defined by:
  t8: int = div t2 t7;
var t11 defined by:
  t11: int = const 0;
var t4 defined by:
  t4: int = const 1;
var t17 defined by:
  t17: int = const 1;
var t14 defined by:
  t14: int = const 2;
var t13 defined by:
  t13: int = const 1;
var t0 defined by:
  t0: int = const 2;
var t3 defined by:
  t3: bool = le t2 b;
var t9 defined by:
  t9: bool = le t6 t8;
var t7 defined by:
  t7: int = const 2;
var t16 defined by:
  t16: int = const 1;
var t15 defined by:
  t15: int = const 1;
var t10 defined by:
  t10: int = call @mod t2 t6;

block11 (for.inner.end):
var t11 defined by:
  t11: int = const 0;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t15 defined by:
  t15: int = const 1;
var t8 defined by:
  t8: int = div t2 t7;
var t7 defined by:
  t7: int = const 2;
var t16 defined by:
  t16: int = const 1;
var t2 defined by:
  t2: int = id a;
var t13 defined by:
  t13: int = const 1;
var t17 defined by:
  t17: int = const 1;
var t0 defined by:
  t0: int = const 2;
var t12 defined by:
  t12: bool = eq t10 t11;
var t6 defined by:
  t6: int = add t15 t6;
var t5 defined by:
  t5: bool = eq t4 t4;
var t9 defined by:
  t9: bool = le t6 t8;
var t14 defined by:
  t14: int = const 2;
var t1 defined by:
  t1: bool = lt a t0;
var t4 defined by:
  t4: int = const 1;
var t3 defined by:
  t3: bool = le t2 b;

block12 (if.outer.body):
var t2 defined by:
  t2: int = id a;
var t3 defined by:
  t3: bool = le t2 b;
var t16 defined by:
  t16: int = const 1;
var t14 defined by:
  t14: int = const 2;
var t13 defined by:
  t13: int = const 1;
var t1 defined by:
  t1: bool = lt a t0;
var t0 defined by:
  t0: int = const 2;
var t9 defined by:
  t9: bool = le t6 t8;
var t5 defined by:
  t5: bool = eq t4 t4;
var t6 defined by:
  t6: int = add t6 t16;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t7 defined by:
  t7: int = const 2;
var t17 defined by:
  t17: int = const 1;
var t15 defined by:
  t15: int = const 1;
var t4 defined by:
  t4: int = const 1;
var t11 defined by:
  t11: int = const 0;
var t12 defined by:
  t12: bool = eq t10 t11;
var t8 defined by:
  t8: int = div t2 t7;

block13 (if.outer.end):
var t13 defined by:
  t13: int = const 1;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t2 defined by:
  t2: int = id a;
var t3 defined by:
  t3: bool = le t2 b;
var t0 defined by:
  t0: int = const 2;
var t16 defined by:
  t16: int = const 1;
var t7 defined by:
  t7: int = const 2;
var t4 defined by:
  t4: int = const 1;
var t11 defined by:
  t11: int = const 0;
var t6 defined by:
  t6: int = add t6 t16;
var t8 defined by:
  t8: int = div t2 t7;
var t15 defined by:
  t15: int = const 1;
var t12 defined by:
  t12: bool = eq t10 t11;
var t5 defined by:
  t5: bool = eq t4 t4;
var t9 defined by:
  t9: bool = le t6 t8;
var t14 defined by:
  t14: int = const 2;
var t17 defined by:
  t17: int = const 1;
var t1 defined by:
  t1: bool = lt a t0;

block14 (for.outer.end):
var t16 defined by:
  t16: int = const 1;
var t15 defined by:
  t15: int = const 1;
var t13 defined by:
  t13: int = const 1;
var t9 defined by:
  t9: bool = le t6 t8;
var t2 defined by:
  t2: int = id a;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t11 defined by:
  t11: int = const 0;
var t5 defined by:
  t5: bool = eq t4 t4;
var t14 defined by:
  t14: int = const 2;
var t17 defined by:
  t17: int = const 1;
var t3 defined by:
  t3: bool = le t2 b;
var t8 defined by:
  t8: int = div t2 t7;
var t0 defined by:
  t0: int = const 2;
var t7 defined by:
  t7: int = const 2;
var t4 defined by:
  t4: int = const 1;
var t1 defined by:
  t1: bool = lt a t0;
var t12 defined by:
  t12: bool = eq t10 t11;
var t6 defined by:
  t6: int = add t6 t16;

OUTS main
block0 (main):

block1 (for.outer.init):
var t0 defined by:
  t0: int = const 2;
var t1 defined by:
  t1: bool = lt a t0;

block2 (true):
var t1 defined by:
  t1: bool = lt a t0;
var t2 defined by:
  t2: int = const 2;
var t0 defined by:
  t0: int = const 2;

block3 (false):
var t2 defined by:
  t2: int = id a;
var t1 defined by:
  t1: bool = lt a t0;
var t0 defined by:
  t0: int = const 2;

block4 (for.outer.cond):
var t0 defined by:
  t0: int = const 2;
var t11 defined by:
  t11: int = const 0;
var t4 defined by:
  t4: int = const 1;
var t3 defined by:
  t3: bool = le t2 b;
var t1 defined by:
  t1: bool = lt a t0;
var t5 defined by:
  t5: bool = eq t4 t4;
var t15 defined by:
  t15: int = const 1;
var t12 defined by:
  t12: bool = eq t10 t11;
var t17 defined by:
  t17: int = const 1;
var t6 defined by:
  t6: int = add t6 t16;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t13 defined by:
  t13: int = const 1;
var t2 defined by:
  t2: int = id a;
var t7 defined by:
  t7: int = const 2;
var t16 defined by:
  t16: int = const 1;
var t8 defined by:
  t8: int = div t2 t7;
var t9 defined by:
  t9: bool = le t6 t8;
var t14 defined by:
  t14: int = const 2;

block5 (for.outer.body):
var t16 defined by:
  t16: int = const 1;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t0 defined by:
  t0: int = const 2;
var t17 defined by:
  t17: int = const 1;
var t2 defined by:
  t2: int = id a;
var t3 defined by:
  t3: bool = le t2 b;
var t11 defined by:
  t11: int = const 0;
var t12 defined by:
  t12: bool = eq t10 t11;
var t9 defined by:
  t9: bool = le t6 t8;
var t8 defined by:
  t8: int = div t2 t7;
var t15 defined by:
  t15: int = const 1;
var t4 defined by:
  t4: int = const 1;
var t6 defined by:
  t6: int = add t6 t16;
var t1 defined by:
  t1: bool = lt a t0;
var t7 defined by:
  t7: int = const 2;
var t14 defined by:
  t14: int = const 2;
var t13 defined by:
  t13: int = const 1;
var t5 defined by:
  t5: bool = eq t4 t4;

block6 (for.inner.init):
var t5 defined by:
  t5: bool = eq t4 t4;
var t1 defined by:
  t1: bool = lt a t0;
var t8 defined by:
  t8: int = div t2 t7;
var t3 defined by:
  t3: bool = le t2 b;
var t17 defined by:
  t17: int = const 1;
var t9 defined by:
  t9: bool = le t6 t8;
var t13 defined by:
  t13: int = const 1;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t6 defined by:
  t6: int = const 2;
var t2 defined by:
  t2: int = id a;
var t12 defined by:
  t12: bool = eq t10 t11;
var t7 defined by:
  t7: int = const 2;
var t0 defined by:
  t0: int = const 2;
var t11 defined by:
  t11: int = const 0;
var t4 defined by:
  t4: int = const 1;
var t14 defined by:
  t14: int = const 2;
var t16 defined by:
  t16: int = const 1;
var t15 defined by:
  t15: int = const 1;

block7 (for.inner.cond):
var t5 defined by:
  t5: bool = eq t4 t4;
var t12 defined by:
  t12: bool = eq t10 t11;
var t4 defined by:
  t4: int = const 1;
var t2 defined by:
  t2: int = id a;
var t11 defined by:
  t11: int = const 0;
var t13 defined by:
  t13: int = const 1;
var t8 defined by:
  t8: int = div t2 t7;
var t15 defined by:
  t15: int = const 1;
var t3 defined by:
  t3: bool = le t2 b;
var t1 defined by:
  t1: bool = lt a t0;
var t16 defined by:
  t16: int = const 1;
var t14 defined by:
  t14: int = const 2;
var t6 defined by:
  t6: int = add t15 t6;
var t17 defined by:
  t17: int = const 1;
var t9 defined by:
  t9: bool = le t6 t8;
var t7 defined by:
  t7: int = const 2;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t0 defined by:
  t0: int = const 2;

block8 (for.inner.body):
var t5 defined by:
  t5: bool = eq t4 t4;
var t2 defined by:
  t2: int = id a;
var t3 defined by:
  t3: bool = le t2 b;
var t7 defined by:
  t7: int = const 2;
var t16 defined by:
  t16: int = const 1;
var t6 defined by:
  t6: int = add t15 t6;
var t17 defined by:
  t17: int = const 1;
var t8 defined by:
  t8: int = div t2 t7;
var t1 defined by:
  t1: bool = lt a t0;
var t9 defined by:
  t9: bool = le t6 t8;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t12 defined by:
  t12: bool = eq t10 t11;
var t14 defined by:
  t14: int = const 2;
var t0 defined by:
  t0: int = const 2;
var t11 defined by:
  t11: int = const 0;
var t4 defined by:
  t4: int = const 1;
var t15 defined by:
  t15: int = const 1;
var t13 defined by:
  t13: int = const 1;

block9 (if.inner.body):
var t14 defined by:
  t14: int = const 2;
var t15 defined by:
  t15: int = const 1;
var t8 defined by:
  t8: int = div t2 t7;
var t0 defined by:
  t0: int = const 2;
var t1 defined by:
  t1: bool = lt a t0;
var t6 defined by:
  t6: int = add t15 t6;
var t5 defined by:
  t5: bool = eq t13 t14;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t7 defined by:
  t7: int = const 2;
var t16 defined by:
  t16: int = const 1;
var t2 defined by:
  t2: int = id a;
var t17 defined by:
  t17: int = const 1;
var t11 defined by:
  t11: int = const 0;
var t4 defined by:
  t4: int = const 1;
var t12 defined by:
  t12: bool = eq t10 t11;
var t13 defined by:
  t13: int = const 1;
var t9 defined by:
  t9: bool = le t6 t8;
var t3 defined by:
  t3: bool = le t2 b;

block10 (if.inner.end):
var t4 defined by:
  t4: int = const 1;
var t12 defined by:
  t12: bool = eq t10 t11;
var t8 defined by:
  t8: int = div t2 t7;
var t14 defined by:
  t14: int = const 2;
var t3 defined by:
  t3: bool = le t2 b;
var t0 defined by:
  t0: int = const 2;
var t1 defined by:
  t1: bool = lt a t0;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t11 defined by:
  t11: int = const 0;
var t5 defined by:
  t5: bool = eq t4 t4;
var t15 defined by:
  t15: int = const 1;
var t16 defined by:
  t16: int = const 1;
var t6 defined by:
  t6: int = add t15 t6;
var t17 defined by:
  t17: int = const 1;
var t9 defined by:
  t9: bool = le t6 t8;
var t2 defined by:
  t2: int = id a;
var t7 defined by:
  t7: int = const 2;
var t13 defined by:
  t13: int = const 1;

block11 (for.inner.end):
var t3 defined by:
  t3: bool = le t2 b;
var t12 defined by:
  t12: bool = eq t10 t11;
var t9 defined by:
  t9: bool = le t6 t8;
var t0 defined by:
  t0: int = const 2;
var t5 defined by:
  t5: bool = eq t4 t4;
var t8 defined by:
  t8: int = div t2 t7;
var t6 defined by:
  t6: int = add t6 t16;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t11 defined by:
  t11: int = const 0;
var t17 defined by:
  t17: int = const 1;
var t14 defined by:
  t14: int = const 2;
var t4 defined by:
  t4: int = const 1;
var t1 defined by:
  t1: bool = lt a t0;
var t2 defined by:
  t2: int = id a;
var t13 defined by:
  t13: int = const 1;
var t15 defined by:
  t15: int = const 1;
var t16 defined by:
  t16: int = const 1;
var t7 defined by:
  t7: int = const 2;

block12 (if.outer.body):
var t16 defined by:
  t16: int = const 1;
var t2 defined by:
  t2: int = id a;
var t8 defined by:
  t8: int = div t2 t7;
var t6 defined by:
  t6: int = add t6 t16;
var t3 defined by:
  t3: bool = le t2 b;
var t0 defined by:
  t0: int = const 2;
var t11 defined by:
  t11: int = const 0;
var t7 defined by:
  t7: int = const 2;
var t1 defined by:
  t1: bool = lt a t0;
var t15 defined by:
  t15: int = const 1;
var t13 defined by:
  t13: int = const 1;
var t5 defined by:
  t5: bool = eq t4 t4;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t14 defined by:
  t14: int = const 2;
var t4 defined by:
  t4: int = const 1;
var t9 defined by:
  t9: bool = le t6 t8;
var t17 defined by:
  t17: int = const 1;
var t12 defined by:
  t12: bool = eq t10 t11;

block13 (if.outer.end):
var t14 defined by:
  t14: int = const 2;
var t7 defined by:
  t7: int = const 2;
var t17 defined by:
  t17: int = const 1;
var t6 defined by:
  t6: int = add t6 t16;
var t16 defined by:
  t16: int = const 1;
var t1 defined by:
  t1: bool = lt a t0;
var t15 defined by:
  t15: int = const 1;
var t2 defined by:
  t2: int = add t2 t17;
var t11 defined by:
  t11: int = const 0;
var t12 defined by:
  t12: bool = eq t10 t11;
var t13 defined by:
  t13: int = const 1;
var t9 defined by:
  t9: bool = le t6 t8;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t8 defined by:
  t8: int = div t2 t7;
var t4 defined by:
  t4: int = const 1;
var t0 defined by:
  t0: int = const 2;
var t3 defined by:
  t3: bool = le t2 b;
var t5 defined by:
  t5: bool = eq t4 t4;

block14 (for.outer.end):
var t16 defined by:
  t16: int = const 1;
var t15 defined by:
  t15: int = const 1;
var t13 defined by:
  t13: int = const 1;
var t9 defined by:
  t9: bool = le t6 t8;
var t2 defined by:
  t2: int = id a;
var t10 defined by:
  t10: int = call @mod t2 t6;
var t11 defined by:
  t11: int = const 0;
var t5 defined by:
  t5: bool = eq t4 t4;
var t14 defined by:
  t14: int = const 2;
var t17 defined by:
  t17: int = const 1;
var t3 defined by:
  t3: bool = le t2 b;
var t8 defined by:
  t8: int = div t2 t7;
var t0 defined by:
  t0: int = const 2;
var t7 defined by:
  t7: int = const 2;
var t4 defined by:
  t4: int = const 1;
var t1 defined by:
  t1: bool = lt a t0;
var t12 defined by:
  t12: bool = eq t10 t11;
var t6 defined by:
  t6: int = add t6 t16;

INS mod
block0 (mod):

OUTS mod
block0 (mod):
var t3 defined by:
  t3: int = sub a t2;
var t1 defined by:
  t1: int = div a b;
var t2 defined by:
  t2: int = mul b t1;

