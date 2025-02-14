INS main
block0 (main):

OUTS main
block0 (main):
var v3 defined by:
  v3: int = const 0;
var v1 defined by:
  v1: int = id x;
var f defined by:
  f: int = id f;
var x defined by:
  x: int = id input;
var v2 defined by:
  v2: int = id f;

INS fac
block0 (fac):

block1 (then.0):
var v2 defined by:
  v2: int = const 1;
var v1 defined by:
  v1: int = id x;
var v3 defined by:
  v3: bool = le v1 v2;

block2 ():

block3 (else.0):
var v2 defined by:
  v2: int = const 1;
var v3 defined by:
  v3: bool = le v1 v2;
var v1 defined by:
  v1: int = id x;

block4 (endif.0):

OUTS fac
block0 (fac):
var v2 defined by:
  v2: int = const 1;
var v3 defined by:
  v3: bool = le v1 v2;
var v1 defined by:
  v1: int = id x;

block1 (then.0):
var v4 defined by:
  v4: int = const 1;
var v3 defined by:
  v3: bool = le v1 v2;
var v2 defined by:
  v2: int = const 1;
var v1 defined by:
  v1: int = id x;

block2 ():

block3 (else.0):
var v1 defined by:
  v1: int = id x;
var v3 defined by:
  v3: bool = le v1 v2;
var v2 defined by:
  v2: int = const 1;

block4 (endif.0):
var v6 defined by:
  v6: int = id x;
var v11 defined by:
  v11: int = id result;
var v5 defined by:
  v5: int = id x;
var v9 defined by:
  v9: int = call @fac v8;
var v8 defined by:
  v8: int = sub v6 v7;
var v7 defined by:
  v7: int = const 1;
var v10 defined by:
  v10: int = mul v5 v9;
var result defined by:
  result: int = id v10;

