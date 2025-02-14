INS main
block0 (main):

block1 (for.cond):
var zero defined by:
  zero: int = const 0;
var ten defined by:
  ten: int = const 10;
var power defined by:
  power: int = call @pow ten index;
var d defined by:
  d: int = div in power;
var one defined by:
  one: int = const 1;
var index defined by:
  index: int = const 1;
var check defined by:
  check: bool = eq d zero;
var not_finished defined by:
  not_finished: bool = const false;

block2 (for.body):
var zero defined by:
  zero: int = const 0;
var d defined by:
  d: int = div in power;
var power defined by:
  power: int = call @pow ten index;
var index defined by:
  index: int = const 1;
var check defined by:
  check: bool = eq d zero;
var ten defined by:
  ten: int = const 10;
var one defined by:
  one: int = const 1;
var not_finished defined by:
  not_finished: bool = const false;

block3 (if.true):
var not_finished defined by:
  not_finished: bool = const false;
var zero defined by:
  zero: int = const 0;
var d defined by:
  d: int = div in power;
var power defined by:
  power: int = call @pow ten index;
var ten defined by:
  ten: int = const 10;
var index defined by:
  index: int = const 1;
var one defined by:
  one: int = const 1;
var check defined by:
  check: bool = eq d zero;

block4 (if.false):
var ten defined by:
  ten: int = const 10;
var power defined by:
  power: int = call @pow ten index;
var one defined by:
  one: int = const 1;
var d defined by:
  d: int = div in power;
var index defined by:
  index: int = const 1;
var zero defined by:
  zero: int = const 0;
var check defined by:
  check: bool = eq d zero;
var not_finished defined by:
  not_finished: bool = const false;

block5 (for.end):
var check defined by:
  check: bool = eq d zero;
var not_finished defined by:
  not_finished: bool = const false;
var zero defined by:
  zero: int = const 0;
var power defined by:
  power: int = call @pow ten index;
var ten defined by:
  ten: int = const 10;
var d defined by:
  d: int = div in power;
var one defined by:
  one: int = const 1;
var index defined by:
  index: int = const 1;

OUTS main
block0 (main):
var index defined by:
  index: int = const 1;
var one defined by:
  one: int = const 1;
var ten defined by:
  ten: int = const 10;
var not_finished defined by:
  not_finished: bool = const true;
var zero defined by:
  zero: int = const 0;

block1 (for.cond):
var check defined by:
  check: bool = eq d zero;
var index defined by:
  index: int = const 1;
var not_finished defined by:
  not_finished: bool = const false;
var zero defined by:
  zero: int = const 0;
var d defined by:
  d: int = div in power;
var one defined by:
  one: int = const 1;
var power defined by:
  power: int = call @pow ten index;
var ten defined by:
  ten: int = const 10;

block2 (for.body):
var d defined by:
  d: int = div in power;
var zero defined by:
  zero: int = const 0;
var ten defined by:
  ten: int = const 10;
var not_finished defined by:
  not_finished: bool = const false;
var check defined by:
  check: bool = eq d zero;
var one defined by:
  one: int = const 1;
var power defined by:
  power: int = call @pow ten index;
var index defined by:
  index: int = const 1;

block3 (if.true):
var ten defined by:
  ten: int = const 10;
var zero defined by:
  zero: int = const 0;
var d defined by:
  d: int = div in power;
var power defined by:
  power: int = call @pow ten index;
var not_finished defined by:
  not_finished: bool = const false;
var index defined by:
  index: int = const 1;
var one defined by:
  one: int = const 1;
var check defined by:
  check: bool = eq d zero;

block4 (if.false):
var ten defined by:
  ten: int = const 10;
var power defined by:
  power: int = call @pow ten index;
var one defined by:
  one: int = const 1;
var d defined by:
  d: int = div in power;
var index defined by:
  index: int = add index one;
var zero defined by:
  zero: int = const 0;
var check defined by:
  check: bool = eq d zero;
var not_finished defined by:
  not_finished: bool = const false;

block5 (for.end):
var ten defined by:
  ten: int = const 10;
var index defined by:
  index: int = const 1;
var exp defined by:
  exp: int = sub index one;
var zero defined by:
  zero: int = const 0;
var d defined by:
  d: int = div in power;
var one defined by:
  one: int = const 1;
var not_finished defined by:
  not_finished: bool = const false;
var power defined by:
  power: int = call @pow ten index;
var is_palindrome defined by:
  is_palindrome: bool = call @palindrome in exp;
var check defined by:
  check: bool = eq d zero;

INS pow
block0 (pow):

block1 (for.cond.pow):
var not_finished defined by:
  not_finished: bool = const true;
var res defined by:
  res: int = const 1;
var one defined by:
  one: int = const 1;
var exp defined by:
  exp: int = sub exp one;
var finished defined by:
  finished: bool = eq exp zero;
var zero defined by:
  zero: int = const 0;

block2 (for.body.pow):
var exp defined by:
  exp: int = sub exp one;
var res defined by:
  res: int = const 1;
var zero defined by:
  zero: int = const 0;
var finished defined by:
  finished: bool = eq exp zero;
var one defined by:
  one: int = const 1;
var not_finished defined by:
  not_finished: bool = const true;

block3 (if.true.pow):
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var not_finished defined by:
  not_finished: bool = const true;
var finished defined by:
  finished: bool = eq exp zero;
var exp defined by:
  exp: int = sub exp one;
var res defined by:
  res: int = const 1;

block4 (if.false.pow):
var exp defined by:
  exp: int = sub exp one;
var not_finished defined by:
  not_finished: bool = const true;
var res defined by:
  res: int = const 1;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var finished defined by:
  finished: bool = eq exp zero;

block5 (for.end.pow):
var res defined by:
  res: int = const 1;
var exp defined by:
  exp: int = sub exp one;
var finished defined by:
  finished: bool = eq exp zero;
var one defined by:
  one: int = const 1;
var not_finished defined by:
  not_finished: bool = const true;
var zero defined by:
  zero: int = const 0;

OUTS pow
block0 (pow):
var one defined by:
  one: int = const 1;
var not_finished defined by:
  not_finished: bool = const true;
var res defined by:
  res: int = const 1;
var zero defined by:
  zero: int = const 0;

block1 (for.cond.pow):
var not_finished defined by:
  not_finished: bool = const true;
var res defined by:
  res: int = const 1;
var one defined by:
  one: int = const 1;
var exp defined by:
  exp: int = sub exp one;
var finished defined by:
  finished: bool = eq exp zero;
var zero defined by:
  zero: int = const 0;

block2 (for.body.pow):
var res defined by:
  res: int = const 1;
var zero defined by:
  zero: int = const 0;
var not_finished defined by:
  not_finished: bool = const true;
var exp defined by:
  exp: int = sub exp one;
var one defined by:
  one: int = const 1;
var finished defined by:
  finished: bool = eq exp zero;

block3 (if.true.pow):
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var not_finished defined by:
  not_finished: bool = const false;
var finished defined by:
  finished: bool = eq exp zero;
var exp defined by:
  exp: int = sub exp one;
var res defined by:
  res: int = const 1;

block4 (if.false.pow):
var exp defined by:
  exp: int = sub exp one;
var not_finished defined by:
  not_finished: bool = const true;
var res defined by:
  res: int = mul res base;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var finished defined by:
  finished: bool = eq exp zero;

block5 (for.end.pow):
var finished defined by:
  finished: bool = eq exp zero;
var exp defined by:
  exp: int = sub exp one;
var res defined by:
  res: int = const 1;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var not_finished defined by:
  not_finished: bool = const true;

INS palindrome
block0 (palindrome):

block1 (if.true.palindrome):
var zero defined by:
  zero: int = const 0;
var ten defined by:
  ten: int = const 10;
var check defined by:
  check: bool = le len zero;
var two defined by:
  two: int = const 2;
var is_palindrome defined by:
  is_palindrome: bool = const false;

block2 (if.false.palindrome):
var two defined by:
  two: int = const 2;
var check defined by:
  check: bool = le len zero;
var is_palindrome defined by:
  is_palindrome: bool = const false;
var ten defined by:
  ten: int = const 10;
var zero defined by:
  zero: int = const 0;

block3 (if.true.mirror):
var left defined by:
  left: int = div in power;
var ten defined by:
  ten: int = const 10;
var check defined by:
  check: bool = le len zero;
var two defined by:
  two: int = const 2;
var is_palindrome defined by:
  is_palindrome: bool = const false;
var zero defined by:
  zero: int = const 0;
var v2 defined by:
  v2: int = mul v1 ten;
var power defined by:
  power: int = call @pow ten len;
var right defined by:
  right: int = sub in v2;
var v1 defined by:
  v1: int = div in ten;
var is_equal defined by:
  is_equal: bool = eq left right;

block4 (if.false.mirror):
var power defined by:
  power: int = call @pow ten len;
var zero defined by:
  zero: int = const 0;
var left defined by:
  left: int = div in power;
var check defined by:
  check: bool = le len zero;
var right defined by:
  right: int = sub in v2;
var two defined by:
  two: int = const 2;
var ten defined by:
  ten: int = const 10;
var is_palindrome defined by:
  is_palindrome: bool = const false;
var v2 defined by:
  v2: int = mul v1 ten;
var is_equal defined by:
  is_equal: bool = eq left right;
var v1 defined by:
  v1: int = div in ten;

block5 (if.end.palindrome):
var two defined by:
  two: int = const 2;
var v1 defined by:
  v1: int = div in ten;
var check defined by:
  check: bool = le len zero;
var v2 defined by:
  v2: int = mul v1 ten;
var power defined by:
  power: int = call @pow ten len;
var temp defined by:
  temp: int = sub temp right;
var is_equal defined by:
  is_equal: bool = eq left right;
var next_in defined by:
  next_in: int = div temp ten;
var right defined by:
  right: int = sub in v2;
var is_palindrome defined by:
  is_palindrome: bool = call @palindrome next_in next_len;
var next_len defined by:
  next_len: int = sub len two;
var ten defined by:
  ten: int = const 10;
var left defined by:
  left: int = div in power;
var zero defined by:
  zero: int = const 0;

OUTS palindrome
block0 (palindrome):
var is_palindrome defined by:
  is_palindrome: bool = const false;
var zero defined by:
  zero: int = const 0;
var two defined by:
  two: int = const 2;
var ten defined by:
  ten: int = const 10;
var check defined by:
  check: bool = le len zero;

block1 (if.true.palindrome):
var is_palindrome defined by:
  is_palindrome: bool = const true;
var zero defined by:
  zero: int = const 0;
var ten defined by:
  ten: int = const 10;
var check defined by:
  check: bool = le len zero;
var two defined by:
  two: int = const 2;

block2 (if.false.palindrome):
var power defined by:
  power: int = call @pow ten len;
var zero defined by:
  zero: int = const 0;
var left defined by:
  left: int = div in power;
var two defined by:
  two: int = const 2;
var check defined by:
  check: bool = le len zero;
var right defined by:
  right: int = sub in v2;
var is_equal defined by:
  is_equal: bool = eq left right;
var ten defined by:
  ten: int = const 10;
var is_palindrome defined by:
  is_palindrome: bool = const false;
var v2 defined by:
  v2: int = mul v1 ten;
var v1 defined by:
  v1: int = div in ten;

block3 (if.true.mirror):
var right defined by:
  right: int = sub in v2;
var ten defined by:
  ten: int = const 10;
var v1 defined by:
  v1: int = div in ten;
var power defined by:
  power: int = call @pow ten len;
var is_equal defined by:
  is_equal: bool = eq left right;
var temp defined by:
  temp: int = sub temp right;
var zero defined by:
  zero: int = const 0;
var v2 defined by:
  v2: int = mul v1 ten;
var left defined by:
  left: int = div in power;
var is_palindrome defined by:
  is_palindrome: bool = call @palindrome next_in next_len;
var two defined by:
  two: int = const 2;
var check defined by:
  check: bool = le len zero;
var next_in defined by:
  next_in: int = div temp ten;
var next_len defined by:
  next_len: int = sub len two;

block4 (if.false.mirror):
var two defined by:
  two: int = const 2;
var is_equal defined by:
  is_equal: bool = eq left right;
var is_palindrome defined by:
  is_palindrome: bool = const false;
var v1 defined by:
  v1: int = div in ten;
var right defined by:
  right: int = sub in v2;
var check defined by:
  check: bool = le len zero;
var left defined by:
  left: int = div in power;
var zero defined by:
  zero: int = const 0;
var ten defined by:
  ten: int = const 10;
var v2 defined by:
  v2: int = mul v1 ten;
var power defined by:
  power: int = call @pow ten len;

block5 (if.end.palindrome):
var ten defined by:
  ten: int = const 10;
var left defined by:
  left: int = div in power;
var v2 defined by:
  v2: int = mul v1 ten;
var check defined by:
  check: bool = le len zero;
var right defined by:
  right: int = sub in v2;
var temp defined by:
  temp: int = sub temp right;
var two defined by:
  two: int = const 2;
var next_in defined by:
  next_in: int = div temp ten;
var next_len defined by:
  next_len: int = sub len two;
var zero defined by:
  zero: int = const 0;
var is_palindrome defined by:
  is_palindrome: bool = call @palindrome next_in next_len;
var is_equal defined by:
  is_equal: bool = eq left right;
var v1 defined by:
  v1: int = div in ten;
var power defined by:
  power: int = call @pow ten len;

