INS main
block0 (main):

OUTS main
block0 (main):
var ans defined by:
  ans: int = call @up_arrow n arrows repeats;

INS up_arrow
block0 (up_arrow):

block1 (loopstart):
var i defined by:
  i: int = add i one;
var one defined by:
  one: int = const 1;
var new_arrows defined by:
  new_arrows: int = sub arrows one;
var keepgoing defined by:
  keepgoing: bool = lt i repeats;
var ans defined by:
  ans: int = call @up_arrow num new_arrows ans;
var base_case defined by:
  base_case: bool = le arrows one;

block2 (loopbody):
var one defined by:
  one: int = const 1;
var new_arrows defined by:
  new_arrows: int = sub arrows one;
var i defined by:
  i: int = add i one;
var base_case defined by:
  base_case: bool = le arrows one;
var ans defined by:
  ans: int = call @up_arrow num new_arrows ans;
var keepgoing defined by:
  keepgoing: bool = lt i repeats;

block3 (base):
var keepgoing defined by:
  keepgoing: bool = lt i repeats;
var one defined by:
  one: int = const 1;
var base_case defined by:
  base_case: bool = le arrows one;
var ans defined by:
  ans: int = call @up_arrow num new_arrows ans;
var new_arrows defined by:
  new_arrows: int = sub arrows one;
var i defined by:
  i: int = add i one;

block4 (arrowsgreaterthan1):
var base_case defined by:
  base_case: bool = le arrows one;
var one defined by:
  one: int = const 1;
var keepgoing defined by:
  keepgoing: bool = lt i repeats;
var ans defined by:
  ans: int = call @up_arrow num new_arrows ans;
var new_arrows defined by:
  new_arrows: int = sub arrows one;
var i defined by:
  i: int = add i one;

block5 (finally):
var base_case defined by:
  base_case: bool = le arrows one;
var one defined by:
  one: int = const 1;
var new_arrows defined by:
  new_arrows: int = sub arrows one;
var keepgoing defined by:
  keepgoing: bool = lt i repeats;
var ans defined by:
  ans: int = call @up_arrow num new_arrows ans;
var i defined by:
  i: int = add i one;

block6 (endloop):
var i defined by:
  i: int = add i one;
var one defined by:
  one: int = const 1;
var base_case defined by:
  base_case: bool = le arrows one;
var keepgoing defined by:
  keepgoing: bool = lt i repeats;
var new_arrows defined by:
  new_arrows: int = sub arrows one;
var ans defined by:
  ans: int = call @up_arrow num new_arrows ans;

OUTS up_arrow
block0 (up_arrow):
var i defined by:
  i: int = const 1;
var one defined by:
  one: int = const 1;
var ans defined by:
  ans: int = id num;

block1 (loopstart):
var i defined by:
  i: int = add i one;
var one defined by:
  one: int = const 1;
var new_arrows defined by:
  new_arrows: int = sub arrows one;
var keepgoing defined by:
  keepgoing: bool = lt i repeats;
var ans defined by:
  ans: int = call @up_arrow num new_arrows ans;
var base_case defined by:
  base_case: bool = le arrows one;

block2 (loopbody):
var base_case defined by:
  base_case: bool = le arrows one;
var one defined by:
  one: int = const 1;
var ans defined by:
  ans: int = call @up_arrow num new_arrows ans;
var keepgoing defined by:
  keepgoing: bool = lt i repeats;
var new_arrows defined by:
  new_arrows: int = sub arrows one;
var i defined by:
  i: int = add i one;

block3 (base):
var ans defined by:
  ans: int = mul ans num;
var one defined by:
  one: int = const 1;
var keepgoing defined by:
  keepgoing: bool = lt i repeats;
var i defined by:
  i: int = add i one;
var base_case defined by:
  base_case: bool = le arrows one;
var new_arrows defined by:
  new_arrows: int = sub arrows one;

block4 (arrowsgreaterthan1):
var new_arrows defined by:
  new_arrows: int = sub arrows one;
var base_case defined by:
  base_case: bool = le arrows one;
var i defined by:
  i: int = add i one;
var keepgoing defined by:
  keepgoing: bool = lt i repeats;
var ans defined by:
  ans: int = call @up_arrow num new_arrows ans;
var one defined by:
  one: int = const 1;

block5 (finally):
var base_case defined by:
  base_case: bool = le arrows one;
var ans defined by:
  ans: int = call @up_arrow num new_arrows ans;
var i defined by:
  i: int = add i one;
var new_arrows defined by:
  new_arrows: int = sub arrows one;
var one defined by:
  one: int = const 1;
var keepgoing defined by:
  keepgoing: bool = lt i repeats;

block6 (endloop):
var keepgoing defined by:
  keepgoing: bool = lt i repeats;
var i defined by:
  i: int = add i one;
var ans defined by:
  ans: int = call @up_arrow num new_arrows ans;
var base_case defined by:
  base_case: bool = le arrows one;
var one defined by:
  one: int = const 1;
var new_arrows defined by:
  new_arrows: int = sub arrows one;

