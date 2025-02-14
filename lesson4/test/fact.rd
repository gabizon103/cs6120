INS main
block0 (main):

OUTS main
block0 (main):
var v13 defined by:
  v13: int = const 0;
var x defined by:
  x: int = call @fact a;

INS fact
block0 (fact):

block1 (then.0):
var v2 defined by:
  v2: int = const 0;
var v3 defined by:
  v3: bool = eq v1 v2;
var v1 defined by:
  v1: int = id a;

block2 (else.0):
var v3 defined by:
  v3: bool = eq v1 v2;
var v1 defined by:
  v1: int = id a;
var v2 defined by:
  v2: int = const 0;

OUTS fact
block0 (fact):
var v2 defined by:
  v2: int = const 0;
var v3 defined by:
  v3: bool = eq v1 v2;
var v1 defined by:
  v1: int = id a;

block1 (then.0):
var v3 defined by:
  v3: bool = eq v1 v2;
var v4 defined by:
  v4: int = const 1;
var v2 defined by:
  v2: int = const 0;
var v1 defined by:
  v1: int = id a;

block2 (else.0):
var v5 defined by:
  v5: int = id a;
var v6 defined by:
  v6: int = id a;
var v3 defined by:
  v3: bool = eq v1 v2;
var v8 defined by:
  v8: int = sub v6 v7;
var v2 defined by:
  v2: int = const 0;
var v10 defined by:
  v10: int = mul v5 v9;
var v7 defined by:
  v7: int = const 1;
var v1 defined by:
  v1: int = id a;
var v9 defined by:
  v9: int = call @fact v8;

