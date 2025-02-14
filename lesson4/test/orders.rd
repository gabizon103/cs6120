INS abs
block0 (abs):

block1 (mul_neg_one):
var zero defined by:
  zero: int = const 0;
var is_neg defined by:
  is_neg: bool = lt a zero;

block2 (abs_res):
var a defined by:
  a: int = mul a neg_one;
var zero defined by:
  zero: int = const 0;
var is_neg defined by:
  is_neg: bool = lt a zero;
var neg_one defined by:
  neg_one: int = const -1;

OUTS abs
block0 (abs):
var zero defined by:
  zero: int = const 0;
var is_neg defined by:
  is_neg: bool = lt a zero;

block1 (mul_neg_one):
var a defined by:
  a: int = mul a neg_one;
var neg_one defined by:
  neg_one: int = const -1;
var zero defined by:
  zero: int = const 0;
var is_neg defined by:
  is_neg: bool = lt a zero;

block2 (abs_res):
var zero defined by:
  zero: int = const 0;
var is_neg defined by:
  is_neg: bool = lt a zero;
var a defined by:
  a: int = mul a neg_one;
var neg_one defined by:
  neg_one: int = const -1;

INS mod
block0 (mod):

OUTS mod
block0 (mod):
var aq defined by:
  aq: int = mul b q;
var mod defined by:
  mod: int = sub a aq;
var q defined by:
  q: int = div a b;

INS gcd
block0 (gcd):

block1 (while.cond):
var is_term defined by:
  is_term: bool = eq mod zero;
var b defined by:
  b: int = id mod;
var mod defined by:
  mod: int = call @mod a b;
var a defined by:
  a: int = id b;
var zero defined by:
  zero: int = const 0;

block2 (while.body):
var mod defined by:
  mod: int = call @mod a b;
var b defined by:
  b: int = id mod;
var a defined by:
  a: int = id b;
var is_term defined by:
  is_term: bool = eq mod zero;
var zero defined by:
  zero: int = const 0;

block3 (while.finish):
var mod defined by:
  mod: int = call @mod a b;
var is_term defined by:
  is_term: bool = eq mod zero;
var zero defined by:
  zero: int = const 0;
var b defined by:
  b: int = id mod;
var a defined by:
  a: int = id b;

OUTS gcd
block0 (gcd):

block1 (while.cond):
var is_term defined by:
  is_term: bool = eq mod zero;
var b defined by:
  b: int = id mod;
var mod defined by:
  mod: int = call @mod a b;
var a defined by:
  a: int = id b;
var zero defined by:
  zero: int = const 0;

block2 (while.body):
var zero defined by:
  zero: int = const 0;
var mod defined by:
  mod: int = call @mod a b;
var a defined by:
  a: int = id b;
var is_term defined by:
  is_term: bool = eq mod zero;
var b defined by:
  b: int = id mod;

block3 (while.finish):
var mod defined by:
  mod: int = call @mod a b;
var is_term defined by:
  is_term: bool = eq mod zero;
var zero defined by:
  zero: int = const 0;
var b defined by:
  b: int = id mod;
var a defined by:
  a: int = id b;

INS lcm
block0 (lcm):

block1 (check_b):
var a_is_zero defined by:
  a_is_zero: bool = eq a zero;
var zero defined by:
  zero: int = const 0;

block2 (special_case):
var zero defined by:
  zero: int = const 0;
var a_is_zero defined by:
  a_is_zero: bool = eq a zero;
var b_is_zero defined by:
  b_is_zero: bool = eq b zero;

block3 (is_good):
var b_is_zero defined by:
  b_is_zero: bool = eq b zero;
var a_is_zero defined by:
  a_is_zero: bool = eq a zero;
var zero defined by:
  zero: int = const 0;

OUTS lcm
block0 (lcm):
var zero defined by:
  zero: int = const 0;
var a_is_zero defined by:
  a_is_zero: bool = eq a zero;

block1 (check_b):
var zero defined by:
  zero: int = const 0;
var b_is_zero defined by:
  b_is_zero: bool = eq b zero;
var a_is_zero defined by:
  a_is_zero: bool = eq a zero;

block2 (special_case):
var zero defined by:
  zero: int = const 0;
var b_is_zero defined by:
  b_is_zero: bool = eq b zero;
var a_is_zero defined by:
  a_is_zero: bool = eq a zero;

block3 (is_good):
var ab defined by:
  ab: int = call @abs ab;
var a_is_zero defined by:
  a_is_zero: bool = eq a zero;
var lcm defined by:
  lcm: int = div ab gcdab;
var gcdab defined by:
  gcdab: int = call @gcd a b;
var zero defined by:
  zero: int = const 0;
var b_is_zero defined by:
  b_is_zero: bool = eq b zero;

INS orders
block0 (orders):

block1 (for.cond):
var is_term defined by:
  is_term: bool = eq u n;
var lcm defined by:
  lcm: int = call @lcm u n;
var ordu defined by:
  ordu: int = div lcm u;
var gcdun defined by:
  gcdun: int = call @gcd u n;
var u defined by:
  u: int = add u one;
var one defined by:
  one: int = const 1;

block2 (for.body):
var lcm defined by:
  lcm: int = call @lcm u n;
var one defined by:
  one: int = const 1;
var u defined by:
  u: int = add u one;
var is_term defined by:
  is_term: bool = eq u n;
var ordu defined by:
  ordu: int = div lcm u;
var gcdun defined by:
  gcdun: int = call @gcd u n;

block3 (lcm):
var u defined by:
  u: int = add u one;
var is_term defined by:
  is_term: bool = eq u n;
var one defined by:
  one: int = const 1;
var ordu defined by:
  ordu: int = div lcm u;
var lcm defined by:
  lcm: int = call @lcm u n;
var gcdun defined by:
  gcdun: int = call @gcd u n;

block4 (gcd):
var u defined by:
  u: int = add u one;
var is_term defined by:
  is_term: bool = eq u n;
var ordu defined by:
  ordu: int = div lcm u;
var lcm defined by:
  lcm: int = call @lcm u n;
var one defined by:
  one: int = const 1;
var gcdun defined by:
  gcdun: int = call @gcd u n;

block5 (for.body.print):
var is_term defined by:
  is_term: bool = eq u n;
var ordu defined by:
  ordu: int = div lcm u;
var one defined by:
  one: int = const 1;
var gcdun defined by:
  gcdun: int = call @gcd u n;
var u defined by:
  u: int = add u one;
var lcm defined by:
  lcm: int = call @lcm u n;

block6 (for.finish):
var one defined by:
  one: int = const 1;
var u defined by:
  u: int = add u one;
var ordu defined by:
  ordu: int = div lcm u;
var is_term defined by:
  is_term: bool = eq u n;
var gcdun defined by:
  gcdun: int = call @gcd u n;
var lcm defined by:
  lcm: int = call @lcm u n;

OUTS orders
block0 (orders):

block1 (for.cond):
var is_term defined by:
  is_term: bool = eq u n;
var gcdun defined by:
  gcdun: int = call @gcd u n;
var lcm defined by:
  lcm: int = call @lcm u n;
var one defined by:
  one: int = const 1;
var ordu defined by:
  ordu: int = div lcm u;
var u defined by:
  u: int = add u one;

block2 (for.body):
var lcm defined by:
  lcm: int = call @lcm u n;
var one defined by:
  one: int = const 1;
var u defined by:
  u: int = add u one;
var is_term defined by:
  is_term: bool = eq u n;
var ordu defined by:
  ordu: int = div lcm u;
var gcdun defined by:
  gcdun: int = call @gcd u n;

block3 (lcm):
var u defined by:
  u: int = add u one;
var is_term defined by:
  is_term: bool = eq u n;
var one defined by:
  one: int = const 1;
var ordu defined by:
  ordu: int = div lcm u;
var lcm defined by:
  lcm: int = call @lcm u n;
var gcdun defined by:
  gcdun: int = call @gcd u n;

block4 (gcd):
var u defined by:
  u: int = add u one;
var is_term defined by:
  is_term: bool = eq u n;
var ordu defined by:
  ordu: int = div n gcdun;
var lcm defined by:
  lcm: int = call @lcm u n;
var one defined by:
  one: int = const 1;
var gcdun defined by:
  gcdun: int = call @gcd u n;

block5 (for.body.print):
var is_term defined by:
  is_term: bool = eq u n;
var one defined by:
  one: int = const 1;
var ordu defined by:
  ordu: int = div lcm u;
var gcdun defined by:
  gcdun: int = call @gcd u n;
var u defined by:
  u: int = add u one;
var lcm defined by:
  lcm: int = call @lcm u n;

block6 (for.finish):
var one defined by:
  one: int = const 1;
var u defined by:
  u: int = add u one;
var ordu defined by:
  ordu: int = div lcm u;
var is_term defined by:
  is_term: bool = eq u n;
var gcdun defined by:
  gcdun: int = call @gcd u n;
var lcm defined by:
  lcm: int = call @lcm u n;

INS main
block0 (main):

OUTS main
block0 (main):
var zero defined by:
  zero: int = const 0;
var n defined by:
  n: int = call @abs n;
var u defined by:
  u: int = const 1;

