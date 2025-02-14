INS main
block0 (main):

block1 (for.cond.3):
var floor defined by:
  floor: int = mul a v1;
var v0 defined by:
  v0: int = const 0;
var remainder defined by:
  remainder: int = sub v5 floor;
var v2 defined by:
  v2: bool = const true;
var notdone defined by:
  notdone: bool = id v2;
var a defined by:
  a: int = div v5 v1;
var n defined by:
  n: int = id input;
var comp1 defined by:
  comp1: bool = eq n v0;
var v4 defined by:
  v4: bool = id notdone;
var v1 defined by:
  v1: int = const 10;
var v5 defined by:
  v5: int = id n;
var result defined by:
  result: int = id v0;

block2 (for.body.3):
var notdone defined by:
  notdone: bool = id v2;
var comp1 defined by:
  comp1: bool = eq n v0;
var v2 defined by:
  v2: bool = const true;
var remainder defined by:
  remainder: int = sub v5 floor;
var v0 defined by:
  v0: int = const 0;
var v1 defined by:
  v1: int = const 10;
var floor defined by:
  floor: int = mul a v1;
var n defined by:
  n: int = id input;
var result defined by:
  result: int = id v0;
var v5 defined by:
  v5: int = id n;
var v4 defined by:
  v4: bool = id notdone;
var a defined by:
  a: int = div v5 v1;

block3 (if.body):
var v0 defined by:
  v0: int = const 0;
var v4 defined by:
  v4: bool = id notdone;
var notdone defined by:
  notdone: bool = id v2;
var comp1 defined by:
  comp1: bool = eq n v0;
var v5 defined by:
  v5: int = id n;
var v1 defined by:
  v1: int = const 10;
var result defined by:
  result: int = add result remainder;
var a defined by:
  a: int = div v5 v1;
var remainder defined by:
  remainder: int = sub v5 floor;
var n defined by:
  n: int = id a;
var floor defined by:
  floor: int = mul a v1;
var v2 defined by:
  v2: bool = const true;

block4 (for.incre):
var v5 defined by:
  v5: int = id n;
var v1 defined by:
  v1: int = const 10;
var a defined by:
  a: int = div v5 v1;
var v4 defined by:
  v4: bool = id notdone;
var comp1 defined by:
  comp1: bool = eq n v0;
var v0 defined by:
  v0: int = const 0;
var n defined by:
  n: int = id a;
var floor defined by:
  floor: int = mul a v1;
var v2 defined by:
  v2: bool = const true;
var remainder defined by:
  remainder: int = sub v5 floor;
var notdone defined by:
  notdone: bool = id v2;
var result defined by:
  result: int = add result remainder;

block5 (for.end.3):
var v4 defined by:
  v4: bool = id notdone;
var v1 defined by:
  v1: int = const 10;
var n defined by:
  n: int = id input;
var notdone defined by:
  notdone: bool = id v2;
var result defined by:
  result: int = id v0;
var a defined by:
  a: int = div v5 v1;
var v2 defined by:
  v2: bool = const true;
var v0 defined by:
  v0: int = const 0;
var comp1 defined by:
  comp1: bool = eq n v0;
var v5 defined by:
  v5: int = id n;
var remainder defined by:
  remainder: int = sub v5 floor;
var floor defined by:
  floor: int = mul a v1;

OUTS main
block0 (main):
var result defined by:
  result: int = id v0;
var v2 defined by:
  v2: bool = const true;
var notdone defined by:
  notdone: bool = id v2;
var v0 defined by:
  v0: int = const 0;
var v1 defined by:
  v1: int = const 10;
var n defined by:
  n: int = id input;

block1 (for.cond.3):
var v1 defined by:
  v1: int = const 10;
var n defined by:
  n: int = id input;
var v5 defined by:
  v5: int = id n;
var notdone defined by:
  notdone: bool = id v2;
var floor defined by:
  floor: int = mul a v1;
var v4 defined by:
  v4: bool = id notdone;
var v0 defined by:
  v0: int = const 0;
var remainder defined by:
  remainder: int = sub v5 floor;
var result defined by:
  result: int = id v0;
var a defined by:
  a: int = div v5 v1;
var v2 defined by:
  v2: bool = const true;
var comp1 defined by:
  comp1: bool = eq n v0;

block2 (for.body.3):
var notdone defined by:
  notdone: bool = id v2;
var comp1 defined by:
  comp1: bool = eq n v0;
var v2 defined by:
  v2: bool = const true;
var remainder defined by:
  remainder: int = sub v5 floor;
var v0 defined by:
  v0: int = const 0;
var v1 defined by:
  v1: int = const 10;
var floor defined by:
  floor: int = mul a v1;
var n defined by:
  n: int = id a;
var result defined by:
  result: int = add result remainder;
var v5 defined by:
  v5: int = id n;
var v4 defined by:
  v4: bool = id notdone;
var a defined by:
  a: int = div v5 v1;

block3 (if.body):
var a defined by:
  a: int = div v5 v1;
var n defined by:
  n: int = id a;
var v4 defined by:
  v4: bool = id notdone;
var v0 defined by:
  v0: int = const 0;
var notdone defined by:
  notdone: bool = const false;
var result defined by:
  result: int = add result remainder;
var comp1 defined by:
  comp1: bool = eq n v0;
var remainder defined by:
  remainder: int = sub v5 floor;
var v2 defined by:
  v2: bool = const true;
var v1 defined by:
  v1: int = const 10;
var v5 defined by:
  v5: int = id n;
var floor defined by:
  floor: int = mul a v1;

block4 (for.incre):
var v5 defined by:
  v5: int = id n;
var v1 defined by:
  v1: int = const 10;
var a defined by:
  a: int = div v5 v1;
var v4 defined by:
  v4: bool = id notdone;
var comp1 defined by:
  comp1: bool = eq n v0;
var v0 defined by:
  v0: int = const 0;
var n defined by:
  n: int = id a;
var floor defined by:
  floor: int = mul a v1;
var v2 defined by:
  v2: bool = const true;
var remainder defined by:
  remainder: int = sub v5 floor;
var notdone defined by:
  notdone: bool = id v2;
var result defined by:
  result: int = add result remainder;

block5 (for.end.3):
var v4 defined by:
  v4: bool = id notdone;
var v1 defined by:
  v1: int = const 10;
var n defined by:
  n: int = id input;
var notdone defined by:
  notdone: bool = id v2;
var result defined by:
  result: int = id v0;
var a defined by:
  a: int = div v5 v1;
var v2 defined by:
  v2: bool = const true;
var v0 defined by:
  v0: int = const 0;
var comp1 defined by:
  comp1: bool = eq n v0;
var v5 defined by:
  v5: int = id n;
var remainder defined by:
  remainder: int = sub v5 floor;
var floor defined by:
  floor: int = mul a v1;

