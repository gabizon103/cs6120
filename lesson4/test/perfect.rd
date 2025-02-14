INS main
block0 (main):

block1 (for.cond.1):
var dif defined by:
  dif: int = sub n mpt;
var v0 defined by:
  v0: int = const 0;
var qut defined by:
  qut: int = div n i;
var comp1 defined by:
  comp1: bool = eq dif v0;
var i defined by:
  i: int = id v2;
var v2 defined by:
  v2: int = const 2;
var comp defined by:
  comp: bool = gt ii n;
var sum defined by:
  sum: int = id v1;
var mpt defined by:
  mpt: int = mul qut i;
var ii defined by:
  ii: int = mul i i;
var n defined by:
  n: int = id input;
var v1 defined by:
  v1: int = const 1;
var result defined by:
  result: int = id v1;

block2 (for.body):
var mpt defined by:
  mpt: int = mul qut i;
var qut defined by:
  qut: int = div n i;
var i defined by:
  i: int = id v2;
var v0 defined by:
  v0: int = const 0;
var v1 defined by:
  v1: int = const 1;
var result defined by:
  result: int = id v1;
var dif defined by:
  dif: int = sub n mpt;
var comp1 defined by:
  comp1: bool = eq dif v0;
var n defined by:
  n: int = id input;
var comp defined by:
  comp: bool = gt ii n;
var sum defined by:
  sum: int = id v1;
var v2 defined by:
  v2: int = const 2;
var ii defined by:
  ii: int = mul i i;

block3 (if.body):
var i defined by:
  i: int = id v2;
var qut defined by:
  qut: int = div n i;
var comp defined by:
  comp: bool = gt ii n;
var result defined by:
  result: int = id v1;
var mpt defined by:
  mpt: int = mul qut i;
var v0 defined by:
  v0: int = const 0;
var comp1 defined by:
  comp1: bool = eq dif v0;
var v2 defined by:
  v2: int = const 2;
var ii defined by:
  ii: int = mul i i;
var dif defined by:
  dif: int = sub n mpt;
var sum defined by:
  sum: int = id v1;
var n defined by:
  n: int = id input;
var v1 defined by:
  v1: int = const 1;

block4 (for.incre):
var n defined by:
  n: int = id input;
var sum defined by:
  sum: int = add sum qut;
var v0 defined by:
  v0: int = const 0;
var result defined by:
  result: int = id v1;
var ii defined by:
  ii: int = mul i i;
var comp defined by:
  comp: bool = gt ii n;
var v1 defined by:
  v1: int = const 1;
var comp1 defined by:
  comp1: bool = eq dif v0;
var qut defined by:
  qut: int = div n i;
var i defined by:
  i: int = id v2;
var dif defined by:
  dif: int = sub n mpt;
var mpt defined by:
  mpt: int = mul qut i;
var v2 defined by:
  v2: int = const 2;

block5 (for.end):
var result defined by:
  result: int = id v1;
var comp1 defined by:
  comp1: bool = eq dif v0;
var mpt defined by:
  mpt: int = mul qut i;
var sum defined by:
  sum: int = id v1;
var comp defined by:
  comp: bool = gt ii n;
var v1 defined by:
  v1: int = const 1;
var v2 defined by:
  v2: int = const 2;
var v0 defined by:
  v0: int = const 0;
var qut defined by:
  qut: int = div n i;
var i defined by:
  i: int = id v2;
var dif defined by:
  dif: int = sub n mpt;
var n defined by:
  n: int = id input;
var ii defined by:
  ii: int = mul i i;

block6 (if.success):
var mpt defined by:
  mpt: int = mul qut i;
var i defined by:
  i: int = id v2;
var v2 defined by:
  v2: int = const 2;
var v0 defined by:
  v0: int = const 0;
var sum defined by:
  sum: int = id v1;
var comp2 defined by:
  comp2: bool = eq sum n;
var dif defined by:
  dif: int = sub n mpt;
var comp defined by:
  comp: bool = gt ii n;
var comp1 defined by:
  comp1: bool = eq dif v0;
var qut defined by:
  qut: int = div n i;
var v1 defined by:
  v1: int = const 1;
var result defined by:
  result: int = id v1;
var ii defined by:
  ii: int = mul i i;
var n defined by:
  n: int = id input;

block7 (if.failure.end):
var sum defined by:
  sum: int = id v1;
var v2 defined by:
  v2: int = const 2;
var v1 defined by:
  v1: int = const 1;
var result defined by:
  result: int = id v0;
var i defined by:
  i: int = id v2;
var comp defined by:
  comp: bool = gt ii n;
var v0 defined by:
  v0: int = const 0;
var n defined by:
  n: int = id input;
var comp2 defined by:
  comp2: bool = eq sum n;
var ii defined by:
  ii: int = mul i i;
var comp1 defined by:
  comp1: bool = eq dif v0;
var dif defined by:
  dif: int = sub n mpt;
var mpt defined by:
  mpt: int = mul qut i;
var qut defined by:
  qut: int = div n i;

OUTS main
block0 (main):
var v0 defined by:
  v0: int = const 0;
var i defined by:
  i: int = id v2;
var result defined by:
  result: int = id v1;
var n defined by:
  n: int = id input;
var sum defined by:
  sum: int = id v1;
var v1 defined by:
  v1: int = const 1;
var v2 defined by:
  v2: int = const 2;

block1 (for.cond.1):
var comp defined by:
  comp: bool = gt ii n;
var n defined by:
  n: int = id input;
var dif defined by:
  dif: int = sub n mpt;
var mpt defined by:
  mpt: int = mul qut i;
var ii defined by:
  ii: int = mul i i;
var sum defined by:
  sum: int = id v1;
var qut defined by:
  qut: int = div n i;
var i defined by:
  i: int = id v2;
var v1 defined by:
  v1: int = const 1;
var v2 defined by:
  v2: int = const 2;
var v0 defined by:
  v0: int = const 0;
var result defined by:
  result: int = id v1;
var comp1 defined by:
  comp1: bool = eq dif v0;

block2 (for.body):
var n defined by:
  n: int = id input;
var i defined by:
  i: int = id v2;
var ii defined by:
  ii: int = mul i i;
var v2 defined by:
  v2: int = const 2;
var qut defined by:
  qut: int = div n i;
var v1 defined by:
  v1: int = const 1;
var comp defined by:
  comp: bool = gt ii n;
var mpt defined by:
  mpt: int = mul qut i;
var dif defined by:
  dif: int = sub n mpt;
var sum defined by:
  sum: int = id v1;
var v0 defined by:
  v0: int = const 0;
var comp1 defined by:
  comp1: bool = eq dif v0;
var result defined by:
  result: int = id v1;

block3 (if.body):
var mpt defined by:
  mpt: int = mul qut i;
var sum defined by:
  sum: int = add sum qut;
var v1 defined by:
  v1: int = const 1;
var comp defined by:
  comp: bool = gt ii n;
var qut defined by:
  qut: int = div n i;
var v2 defined by:
  v2: int = const 2;
var ii defined by:
  ii: int = mul i i;
var v0 defined by:
  v0: int = const 0;
var result defined by:
  result: int = id v1;
var n defined by:
  n: int = id input;
var comp1 defined by:
  comp1: bool = eq dif v0;
var i defined by:
  i: int = id v2;
var dif defined by:
  dif: int = sub n mpt;

block4 (for.incre):
var comp defined by:
  comp: bool = gt ii n;
var i defined by:
  i: int = add i v1;
var n defined by:
  n: int = id input;
var ii defined by:
  ii: int = mul i i;
var sum defined by:
  sum: int = add sum qut;
var v2 defined by:
  v2: int = const 2;
var dif defined by:
  dif: int = sub n mpt;
var mpt defined by:
  mpt: int = mul qut i;
var v0 defined by:
  v0: int = const 0;
var v1 defined by:
  v1: int = const 1;
var result defined by:
  result: int = id v1;
var qut defined by:
  qut: int = div n i;
var comp1 defined by:
  comp1: bool = eq dif v0;

block5 (for.end):
var sum defined by:
  sum: int = id v1;
var result defined by:
  result: int = id v1;
var comp defined by:
  comp: bool = gt ii n;
var v2 defined by:
  v2: int = const 2;
var comp2 defined by:
  comp2: bool = eq sum n;
var comp1 defined by:
  comp1: bool = eq dif v0;
var n defined by:
  n: int = id input;
var ii defined by:
  ii: int = mul i i;
var dif defined by:
  dif: int = sub n mpt;
var qut defined by:
  qut: int = div n i;
var i defined by:
  i: int = id v2;
var v1 defined by:
  v1: int = const 1;
var v0 defined by:
  v0: int = const 0;
var mpt defined by:
  mpt: int = mul qut i;

block6 (if.success):
var n defined by:
  n: int = id input;
var comp defined by:
  comp: bool = gt ii n;
var comp1 defined by:
  comp1: bool = eq dif v0;
var result defined by:
  result: int = id v0;
var sum defined by:
  sum: int = id v1;
var v0 defined by:
  v0: int = const 0;
var ii defined by:
  ii: int = mul i i;
var v2 defined by:
  v2: int = const 2;
var dif defined by:
  dif: int = sub n mpt;
var i defined by:
  i: int = id v2;
var qut defined by:
  qut: int = div n i;
var mpt defined by:
  mpt: int = mul qut i;
var comp2 defined by:
  comp2: bool = eq sum n;
var v1 defined by:
  v1: int = const 1;

block7 (if.failure.end):
var comp1 defined by:
  comp1: bool = eq dif v0;
var v0 defined by:
  v0: int = const 0;
var ii defined by:
  ii: int = mul i i;
var qut defined by:
  qut: int = div n i;
var comp defined by:
  comp: bool = gt ii n;
var comp2 defined by:
  comp2: bool = eq sum n;
var sum defined by:
  sum: int = id v1;
var result defined by:
  result: int = id v0;
var v1 defined by:
  v1: int = const 1;
var mpt defined by:
  mpt: int = mul qut i;
var n defined by:
  n: int = id input;
var dif defined by:
  dif: int = sub n mpt;
var v2 defined by:
  v2: int = const 2;
var i defined by:
  i: int = id v2;

