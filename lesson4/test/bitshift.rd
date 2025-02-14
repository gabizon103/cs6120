INS pow
block0 (pow):

block1 (then.0):
var v2 defined by:
  v2: int = const 1;
var v1 defined by:
  v1: int = id n;
var v3 defined by:
  v3: bool = eq v1 v2;

block2 (else.0):
var v3 defined by:
  v3: bool = eq v1 v2;
var v2 defined by:
  v2: int = const 1;
var v1 defined by:
  v1: int = id n;

block3 (then.12):
var half2 defined by:
  half2: int = id v11;
var half defined by:
  half: int = id half;
var v17 defined by:
  v17: bool = eq v15 v16;
var v13 defined by:
  v13: int = id n;
var v9 defined by:
  v9: int = id half;
var v1 defined by:
  v1: int = id n;
var v6 defined by:
  v6: int = id n;
var v3 defined by:
  v3: bool = eq v1 v2;
var v11 defined by:
  v11: int = mul v9 v10;
var v15 defined by:
  v15: int = call @mod v13 v14;
var v10 defined by:
  v10: int = id half;
var v16 defined by:
  v16: int = const 1;
var v14 defined by:
  v14: int = const 2;
var v8 defined by:
  v8: int = div v6 v7;
var v2 defined by:
  v2: int = const 1;
var v7 defined by:
  v7: int = const 2;
var v5 defined by:
  v5: int = id x;

block4 (else.12):
var v6 defined by:
  v6: int = id n;
var v7 defined by:
  v7: int = const 2;
var v14 defined by:
  v14: int = const 2;
var v9 defined by:
  v9: int = id half;
var v5 defined by:
  v5: int = id x;
var v8 defined by:
  v8: int = div v6 v7;
var v11 defined by:
  v11: int = mul v9 v10;
var half2 defined by:
  half2: int = id v11;
var v2 defined by:
  v2: int = const 1;
var v10 defined by:
  v10: int = id half;
var v13 defined by:
  v13: int = id n;
var v17 defined by:
  v17: bool = eq v15 v16;
var v3 defined by:
  v3: bool = eq v1 v2;
var half defined by:
  half: int = id half;
var v16 defined by:
  v16: int = const 1;
var v1 defined by:
  v1: int = id n;
var v15 defined by:
  v15: int = call @mod v13 v14;

block5 (endif.12):
var v16 defined by:
  v16: int = const 1;
var v15 defined by:
  v15: int = call @mod v13 v14;
var v18 defined by:
  v18: int = id half2;
var v5 defined by:
  v5: int = id x;
var v13 defined by:
  v13: int = id n;
var v2 defined by:
  v2: int = const 1;
var v21 defined by:
  v21: int = id half2;
var v11 defined by:
  v11: int = mul v9 v10;
var v19 defined by:
  v19: int = id x;
var v8 defined by:
  v8: int = div v6 v7;
var v20 defined by:
  v20: int = mul v18 v19;
var half2 defined by:
  half2: int = id v11;
var v17 defined by:
  v17: bool = eq v15 v16;
var v10 defined by:
  v10: int = id half;
var v6 defined by:
  v6: int = id n;
var ans defined by:
  ans: int = id v21;
var half defined by:
  half: int = id half;
var v14 defined by:
  v14: int = const 2;
var v9 defined by:
  v9: int = id half;
var v3 defined by:
  v3: bool = eq v1 v2;
var v7 defined by:
  v7: int = const 2;
var v1 defined by:
  v1: int = id n;

OUTS pow
block0 (pow):
var v1 defined by:
  v1: int = id n;
var v2 defined by:
  v2: int = const 1;
var v3 defined by:
  v3: bool = eq v1 v2;

block1 (then.0):
var v3 defined by:
  v3: bool = eq v1 v2;
var v4 defined by:
  v4: int = id x;
var v1 defined by:
  v1: int = id n;
var v2 defined by:
  v2: int = const 1;

block2 (else.0):
var v15 defined by:
  v15: int = call @mod v13 v14;
var half defined by:
  half: int = id half;
var half2 defined by:
  half2: int = id v11;
var v14 defined by:
  v14: int = const 2;
var v16 defined by:
  v16: int = const 1;
var v9 defined by:
  v9: int = id half;
var v3 defined by:
  v3: bool = eq v1 v2;
var v10 defined by:
  v10: int = id half;
var v7 defined by:
  v7: int = const 2;
var v17 defined by:
  v17: bool = eq v15 v16;
var v5 defined by:
  v5: int = id x;
var v6 defined by:
  v6: int = id n;
var v8 defined by:
  v8: int = div v6 v7;
var v13 defined by:
  v13: int = id n;
var v11 defined by:
  v11: int = mul v9 v10;
var v2 defined by:
  v2: int = const 1;
var v1 defined by:
  v1: int = id n;

block3 (then.12):
var half2 defined by:
  half2: int = id v11;
var half defined by:
  half: int = id half;
var v16 defined by:
  v16: int = const 1;
var v3 defined by:
  v3: bool = eq v1 v2;
var v20 defined by:
  v20: int = mul v18 v19;
var v14 defined by:
  v14: int = const 2;
var v6 defined by:
  v6: int = id n;
var v17 defined by:
  v17: bool = eq v15 v16;
var v2 defined by:
  v2: int = const 1;
var v7 defined by:
  v7: int = const 2;
var v1 defined by:
  v1: int = id n;
var v10 defined by:
  v10: int = id half;
var v15 defined by:
  v15: int = call @mod v13 v14;
var v9 defined by:
  v9: int = id half;
var v11 defined by:
  v11: int = mul v9 v10;
var v18 defined by:
  v18: int = id half2;
var ans defined by:
  ans: int = id v20;
var v19 defined by:
  v19: int = id x;
var v5 defined by:
  v5: int = id x;
var v8 defined by:
  v8: int = div v6 v7;
var v13 defined by:
  v13: int = id n;

block4 (else.12):
var v7 defined by:
  v7: int = const 2;
var v9 defined by:
  v9: int = id half;
var v14 defined by:
  v14: int = const 2;
var v16 defined by:
  v16: int = const 1;
var v5 defined by:
  v5: int = id x;
var v2 defined by:
  v2: int = const 1;
var v21 defined by:
  v21: int = id half2;
var half2 defined by:
  half2: int = id v11;
var v15 defined by:
  v15: int = call @mod v13 v14;
var v1 defined by:
  v1: int = id n;
var v17 defined by:
  v17: bool = eq v15 v16;
var v11 defined by:
  v11: int = mul v9 v10;
var v3 defined by:
  v3: bool = eq v1 v2;
var ans defined by:
  ans: int = id v21;
var half defined by:
  half: int = id half;
var v8 defined by:
  v8: int = div v6 v7;
var v6 defined by:
  v6: int = id n;
var v13 defined by:
  v13: int = id n;
var v10 defined by:
  v10: int = id half;

block5 (endif.12):
var v20 defined by:
  v20: int = mul v18 v19;
var v6 defined by:
  v6: int = id n;
var v8 defined by:
  v8: int = div v6 v7;
var half defined by:
  half: int = id half;
var v11 defined by:
  v11: int = mul v9 v10;
var v1 defined by:
  v1: int = id n;
var v5 defined by:
  v5: int = id x;
var v3 defined by:
  v3: bool = eq v1 v2;
var v13 defined by:
  v13: int = id n;
var v17 defined by:
  v17: bool = eq v15 v16;
var v7 defined by:
  v7: int = const 2;
var v14 defined by:
  v14: int = const 2;
var v15 defined by:
  v15: int = call @mod v13 v14;
var v9 defined by:
  v9: int = id half;
var ans defined by:
  ans: int = id v21;
var v10 defined by:
  v10: int = id half;
var v19 defined by:
  v19: int = id x;
var v16 defined by:
  v16: int = const 1;
var v2 defined by:
  v2: int = const 1;
var v21 defined by:
  v21: int = id half2;
var v22 defined by:
  v22: int = id ans;
var half2 defined by:
  half2: int = id v11;
var v18 defined by:
  v18: int = id half2;

INS mod
block0 (mod):

OUTS mod
block0 (mod):
var v1 defined by:
  v1: int = id a;
var v0 defined by:
  v0: int = id a;
var v4 defined by:
  v4: int = id b;
var v2 defined by:
  v2: int = id b;
var v3 defined by:
  v3: int = div v1 v2;
var v5 defined by:
  v5: int = mul v3 v4;
var v6 defined by:
  v6: int = sub v0 v5;

INS LEFTSHIFT
block0 (LEFTSHIFT):

OUTS LEFTSHIFT
block0 (LEFTSHIFT):
var v1 defined by:
  v1: int = id step;
var v0 defined by:
  v0: int = const 2;
var v3 defined by:
  v3: int = id p;
var v4 defined by:
  v4: int = mul v2 v3;
var v2 defined by:
  v2: int = id x;
var p defined by:
  p: int = id p;

INS RIGHTSHIFT
block0 (RIGHTSHIFT):

OUTS RIGHTSHIFT
block0 (RIGHTSHIFT):
var v1 defined by:
  v1: int = id step;
var v2 defined by:
  v2: int = id x;
var v0 defined by:
  v0: int = const 2;
var v4 defined by:
  v4: int = div v2 v3;
var v3 defined by:
  v3: int = id p;
var p defined by:
  p: int = id p;

INS main
block0 (main):

OUTS main
block0 (main):
var ans1 defined by:
  ans1: int = call @LEFTSHIFT v2 v3;
var v4 defined by:
  v4: int = id c;
var v2 defined by:
  v2: int = id a;
var v5 defined by:
  v5: int = id d;
var v3 defined by:
  v3: int = id b;
var ans2 defined by:
  ans2: int = call @RIGHTSHIFT v4 v5;

