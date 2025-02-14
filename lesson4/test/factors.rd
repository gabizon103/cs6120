INS main
block0 (main):

block1 (loopcheck):
var quo defined by:
  quo: int = div num fac;
var one defined by:
  one: int = const 1;
var num defined by:
  num: int = div num fac;
var zer defined by:
  zer: int = const 0;
var fac defined by:
  fac: int = const 2;
var mod defined by:
  mod: int = sub num tmp;
var tmp defined by:
  tmp: int = mul quo fac;
var iszero defined by:
  iszero: bool = eq mod zer;
var ispos defined by:
  ispos: bool = lt one num;

block2 (loopbody):
var quo defined by:
  quo: int = div num fac;
var fac defined by:
  fac: int = const 2;
var ispos defined by:
  ispos: bool = lt one num;
var iszero defined by:
  iszero: bool = eq mod zer;
var mod defined by:
  mod: int = sub num tmp;
var tmp defined by:
  tmp: int = mul quo fac;
var zer defined by:
  zer: int = const 0;
var num defined by:
  num: int = div num fac;
var one defined by:
  one: int = const 1;

block3 (ifyes):
var num defined by:
  num: int = div num fac;
var mod defined by:
  mod: int = sub num tmp;
var iszero defined by:
  iszero: bool = eq mod zer;
var one defined by:
  one: int = const 1;
var fac defined by:
  fac: int = const 2;
var tmp defined by:
  tmp: int = mul quo fac;
var zer defined by:
  zer: int = const 0;
var ispos defined by:
  ispos: bool = lt one num;
var quo defined by:
  quo: int = div num fac;

block4 (ifno):
var fac defined by:
  fac: int = const 2;
var ispos defined by:
  ispos: bool = lt one num;
var tmp defined by:
  tmp: int = mul quo fac;
var zer defined by:
  zer: int = const 0;
var mod defined by:
  mod: int = sub num tmp;
var quo defined by:
  quo: int = div num fac;
var one defined by:
  one: int = const 1;
var iszero defined by:
  iszero: bool = eq mod zer;
var num defined by:
  num: int = div num fac;

block5 (loopend):
var one defined by:
  one: int = const 1;
var quo defined by:
  quo: int = div num fac;
var tmp defined by:
  tmp: int = mul quo fac;
var fac defined by:
  fac: int = const 2;
var num defined by:
  num: int = div num fac;
var ispos defined by:
  ispos: bool = lt one num;
var mod defined by:
  mod: int = sub num tmp;
var zer defined by:
  zer: int = const 0;
var iszero defined by:
  iszero: bool = eq mod zer;

OUTS main
block0 (main):
var one defined by:
  one: int = const 1;
var fac defined by:
  fac: int = const 2;
var zer defined by:
  zer: int = const 0;

block1 (loopcheck):
var quo defined by:
  quo: int = div num fac;
var zer defined by:
  zer: int = const 0;
var mod defined by:
  mod: int = sub num tmp;
var tmp defined by:
  tmp: int = mul quo fac;
var num defined by:
  num: int = div num fac;
var ispos defined by:
  ispos: bool = lt one num;
var one defined by:
  one: int = const 1;
var iszero defined by:
  iszero: bool = eq mod zer;
var fac defined by:
  fac: int = const 2;

block2 (loopbody):
var zer defined by:
  zer: int = const 0;
var tmp defined by:
  tmp: int = mul quo fac;
var num defined by:
  num: int = div num fac;
var mod defined by:
  mod: int = sub num tmp;
var ispos defined by:
  ispos: bool = lt one num;
var iszero defined by:
  iszero: bool = eq mod zer;
var fac defined by:
  fac: int = const 2;
var quo defined by:
  quo: int = div num fac;
var one defined by:
  one: int = const 1;

block3 (ifyes):
var quo defined by:
  quo: int = div num fac;
var tmp defined by:
  tmp: int = mul quo fac;
var zer defined by:
  zer: int = const 0;
var mod defined by:
  mod: int = sub num tmp;
var num defined by:
  num: int = div num fac;
var one defined by:
  one: int = const 1;
var fac defined by:
  fac: int = const 2;
var iszero defined by:
  iszero: bool = eq mod zer;
var ispos defined by:
  ispos: bool = lt one num;

block4 (ifno):
var quo defined by:
  quo: int = div num fac;
var num defined by:
  num: int = div num fac;
var mod defined by:
  mod: int = sub num tmp;
var zer defined by:
  zer: int = const 0;
var tmp defined by:
  tmp: int = mul quo fac;
var one defined by:
  one: int = const 1;
var ispos defined by:
  ispos: bool = lt one num;
var iszero defined by:
  iszero: bool = eq mod zer;
var fac defined by:
  fac: int = add fac one;

block5 (loopend):
var quo defined by:
  quo: int = div num fac;
var one defined by:
  one: int = const 1;
var fac defined by:
  fac: int = const 2;
var mod defined by:
  mod: int = sub num tmp;
var tmp defined by:
  tmp: int = mul quo fac;
var num defined by:
  num: int = div num fac;
var ispos defined by:
  ispos: bool = lt one num;
var iszero defined by:
  iszero: bool = eq mod zer;
var zer defined by:
  zer: int = const 0;

