INS main
block0 (main):

OUTS main
block0 (main):
var a defined by:
  a: int = id v0;
var v0 defined by:
  v0: int = const 20;
var v1 defined by:
  v1: int = id a;
var v2 defined by:
  v2: int = const 0;

INS mod
block0 (mod):

OUTS mod
block0 (mod):
var v2 defined by:
  v2: int = div v0 v1;
var v4 defined by:
  v4: int = sub v0 v3;
var v0 defined by:
  v0: int = id a;
var v1 defined by:
  v1: int = id b;
var v3 defined by:
  v3: int = mul v2 v1;

INS gcd
block0 (gcd):

block1 (then.0):
var v3 defined by:
  v3: bool = gt v1 v2;
var v2 defined by:
  v2: int = id a;
var v1 defined by:
  v1: int = id b;

block2 (else.0):
var v3 defined by:
  v3: bool = gt v1 v2;
var v1 defined by:
  v1: int = id b;
var v2 defined by:
  v2: int = id a;

block3 (endif.0):
var v2 defined by:
  v2: int = id a;
var tmp defined by:
  tmp: int = id v4;
var v5 defined by:
  v5: int = id b;
var v3 defined by:
  v3: bool = gt v1 v2;
var v6 defined by:
  v6: int = id tmp;
var v4 defined by:
  v4: int = id a;
var b defined by:
  b: int = id v6;
var a defined by:
  a: int = id v5;
var v1 defined by:
  v1: int = id b;

block4 (then.7):
var v8 defined by:
  v8: int = id a;
var v1 defined by:
  v1: int = id b;
var a defined by:
  a: int = id v5;
var tmp defined by:
  tmp: int = id v4;
var v9 defined by:
  v9: int = const 0;
var v2 defined by:
  v2: int = id a;
var v5 defined by:
  v5: int = id b;
var v4 defined by:
  v4: int = id a;
var v6 defined by:
  v6: int = id tmp;
var v10 defined by:
  v10: bool = eq v8 v9;
var v3 defined by:
  v3: bool = gt v1 v2;
var b defined by:
  b: int = id v6;

block5 ():

block6 (else.7):
var v4 defined by:
  v4: int = id a;
var v1 defined by:
  v1: int = id b;
var v9 defined by:
  v9: int = const 0;
var v3 defined by:
  v3: bool = gt v1 v2;
var a defined by:
  a: int = id v5;
var v10 defined by:
  v10: bool = eq v8 v9;
var v2 defined by:
  v2: int = id a;
var v6 defined by:
  v6: int = id tmp;
var v8 defined by:
  v8: int = id a;
var tmp defined by:
  tmp: int = id v4;
var b defined by:
  b: int = id v6;
var v5 defined by:
  v5: int = id b;

block7 (then.12):
var v2 defined by:
  v2: int = id a;
var v9 defined by:
  v9: int = const 0;
var v6 defined by:
  v6: int = id tmp;
var v8 defined by:
  v8: int = id a;
var v4 defined by:
  v4: int = id a;
var v15 defined by:
  v15: bool = eq v13 v14;
var v13 defined by:
  v13: int = id b;
var v14 defined by:
  v14: int = const 0;
var b defined by:
  b: int = id v6;
var a defined by:
  a: int = id v5;
var v1 defined by:
  v1: int = id b;
var tmp defined by:
  tmp: int = id v4;
var v5 defined by:
  v5: int = id b;
var v10 defined by:
  v10: bool = eq v8 v9;
var v3 defined by:
  v3: bool = gt v1 v2;

block8 ():

block9 (else.12):
var v2 defined by:
  v2: int = id a;
var v8 defined by:
  v8: int = id a;
var v4 defined by:
  v4: int = id a;
var v5 defined by:
  v5: int = id b;
var a defined by:
  a: int = id v5;
var v3 defined by:
  v3: bool = gt v1 v2;
var b defined by:
  b: int = id v6;
var v6 defined by:
  v6: int = id tmp;
var v9 defined by:
  v9: int = const 0;
var v15 defined by:
  v15: bool = eq v13 v14;
var v10 defined by:
  v10: bool = eq v8 v9;
var v14 defined by:
  v14: int = const 0;
var tmp defined by:
  tmp: int = id v4;
var v1 defined by:
  v1: int = id b;
var v13 defined by:
  v13: int = id b;

block10 (endif.12):

block11 (endif.7):

OUTS gcd
block0 (gcd):
var v1 defined by:
  v1: int = id b;
var v2 defined by:
  v2: int = id a;
var v3 defined by:
  v3: bool = gt v1 v2;

block1 (then.0):
var tmp defined by:
  tmp: int = id v4;
var v2 defined by:
  v2: int = id a;
var b defined by:
  b: int = id v6;
var v5 defined by:
  v5: int = id b;
var a defined by:
  a: int = id v5;
var v4 defined by:
  v4: int = id a;
var v6 defined by:
  v6: int = id tmp;
var v1 defined by:
  v1: int = id b;
var v3 defined by:
  v3: bool = gt v1 v2;

block2 (else.0):
var v3 defined by:
  v3: bool = gt v1 v2;
var v1 defined by:
  v1: int = id b;
var v2 defined by:
  v2: int = id a;

block3 (endif.0):
var v8 defined by:
  v8: int = id a;
var v9 defined by:
  v9: int = const 0;
var v10 defined by:
  v10: bool = eq v8 v9;
var v3 defined by:
  v3: bool = gt v1 v2;
var v1 defined by:
  v1: int = id b;
var a defined by:
  a: int = id v5;
var b defined by:
  b: int = id v6;
var tmp defined by:
  tmp: int = id v4;
var v2 defined by:
  v2: int = id a;
var v5 defined by:
  v5: int = id b;
var v4 defined by:
  v4: int = id a;
var v6 defined by:
  v6: int = id tmp;

block4 (then.7):
var a defined by:
  a: int = id v5;
var v11 defined by:
  v11: int = id b;
var v8 defined by:
  v8: int = id a;
var v2 defined by:
  v2: int = id a;
var v9 defined by:
  v9: int = const 0;
var tmp defined by:
  tmp: int = id v4;
var v10 defined by:
  v10: bool = eq v8 v9;
var v3 defined by:
  v3: bool = gt v1 v2;
var v1 defined by:
  v1: int = id b;
var b defined by:
  b: int = id v6;
var v5 defined by:
  v5: int = id b;
var v4 defined by:
  v4: int = id a;
var v6 defined by:
  v6: int = id tmp;

block5 ():

block6 (else.7):
var v10 defined by:
  v10: bool = eq v8 v9;
var v9 defined by:
  v9: int = const 0;
var v8 defined by:
  v8: int = id a;
var v14 defined by:
  v14: int = const 0;
var v15 defined by:
  v15: bool = eq v13 v14;
var v6 defined by:
  v6: int = id tmp;
var v3 defined by:
  v3: bool = gt v1 v2;
var v1 defined by:
  v1: int = id b;
var v4 defined by:
  v4: int = id a;
var v5 defined by:
  v5: int = id b;
var a defined by:
  a: int = id v5;
var b defined by:
  b: int = id v6;
var tmp defined by:
  tmp: int = id v4;
var v2 defined by:
  v2: int = id a;
var v13 defined by:
  v13: int = id b;

block7 (then.12):
var v4 defined by:
  v4: int = id a;
var tmp defined by:
  tmp: int = id v4;
var v8 defined by:
  v8: int = id a;
var a defined by:
  a: int = id v5;
var v13 defined by:
  v13: int = id b;
var v9 defined by:
  v9: int = const 0;
var v16 defined by:
  v16: int = id a;
var v1 defined by:
  v1: int = id b;
var v5 defined by:
  v5: int = id b;
var v2 defined by:
  v2: int = id a;
var v6 defined by:
  v6: int = id tmp;
var b defined by:
  b: int = id v6;
var v15 defined by:
  v15: bool = eq v13 v14;
var v3 defined by:
  v3: bool = gt v1 v2;
var v14 defined by:
  v14: int = const 0;
var v10 defined by:
  v10: bool = eq v8 v9;

block8 ():

block9 (else.12):
var v8 defined by:
  v8: int = id a;
var v10 defined by:
  v10: bool = eq v8 v9;
var a defined by:
  a: int = id v5;
var v2 defined by:
  v2: int = id a;
var v4 defined by:
  v4: int = id a;
var tmp defined by:
  tmp: int = id v4;
var v3 defined by:
  v3: bool = gt v1 v2;
var v15 defined by:
  v15: bool = eq v13 v14;
var v1 defined by:
  v1: int = id b;
var v13 defined by:
  v13: int = id b;
var v9 defined by:
  v9: int = const 0;
var v14 defined by:
  v14: int = const 0;
var v6 defined by:
  v6: int = id tmp;
var b defined by:
  b: int = id v6;
var v5 defined by:
  v5: int = id b;

block10 (endif.12):

block11 (endif.7):
var v19 defined by:
  v19: int = id b;
var v17 defined by:
  v17: int = id a;
var g defined by:
  g: int = id g;
var v20 defined by:
  v20: int = id remainder;
var v21 defined by:
  v21: int = id g;
var v18 defined by:
  v18: int = id b;
var remainder defined by:
  remainder: int = id remainder;

INS relative_primes
block0 (relative_primes):

block1 (for.cond.0):
var v6 defined by:
  v6: int = id b;
var v4 defined by:
  v4: bool = ge v2 v3;
var v2 defined by:
  v2: int = id b;
var v12 defined by:
  v12: int = const 0;
var v13 defined by:
  v13: int = id b;
var v14 defined by:
  v14: int = const 1;
var v11 defined by:
  v11: int = id b;
var v8 defined by:
  v8: int = id g;
var b defined by:
  b: int = id v15;
var v1 defined by:
  v1: int = id a;
var v5 defined by:
  v5: int = id a;
var v10 defined by:
  v10: bool = eq v8 v9;
var v15 defined by:
  v15: int = sub v13 v14;
var v9 defined by:
  v9: int = const 1;
var v3 defined by:
  v3: int = const 1;
var g defined by:
  g: int = id g;

block2 (for.body.0):
var v8 defined by:
  v8: int = id g;
var b defined by:
  b: int = id v15;
var v15 defined by:
  v15: int = sub v13 v14;
var v13 defined by:
  v13: int = id b;
var v1 defined by:
  v1: int = id a;
var v3 defined by:
  v3: int = const 1;
var v14 defined by:
  v14: int = const 1;
var v9 defined by:
  v9: int = const 1;
var v5 defined by:
  v5: int = id a;
var v11 defined by:
  v11: int = id b;
var v12 defined by:
  v12: int = const 0;
var g defined by:
  g: int = id g;
var v2 defined by:
  v2: int = id b;
var v6 defined by:
  v6: int = id b;
var v4 defined by:
  v4: bool = ge v2 v3;
var v10 defined by:
  v10: bool = eq v8 v9;

block3 (then.7):
var v1 defined by:
  v1: int = id a;
var b defined by:
  b: int = id v15;
var v5 defined by:
  v5: int = id a;
var v9 defined by:
  v9: int = const 1;
var v10 defined by:
  v10: bool = eq v8 v9;
var v4 defined by:
  v4: bool = ge v2 v3;
var v2 defined by:
  v2: int = id b;
var v8 defined by:
  v8: int = id g;
var v13 defined by:
  v13: int = id b;
var v6 defined by:
  v6: int = id b;
var g defined by:
  g: int = id g;
var v14 defined by:
  v14: int = const 1;
var v12 defined by:
  v12: int = const 0;
var v15 defined by:
  v15: int = sub v13 v14;
var v3 defined by:
  v3: int = const 1;
var v11 defined by:
  v11: int = id b;

block4 (else.7):
var v5 defined by:
  v5: int = id a;
var v10 defined by:
  v10: bool = eq v8 v9;
var v6 defined by:
  v6: int = id b;
var v2 defined by:
  v2: int = id b;
var v9 defined by:
  v9: int = const 1;
var v14 defined by:
  v14: int = const 1;
var v13 defined by:
  v13: int = id b;
var g defined by:
  g: int = id g;
var v8 defined by:
  v8: int = id g;
var v4 defined by:
  v4: bool = ge v2 v3;
var v12 defined by:
  v12: int = const 0;
var v15 defined by:
  v15: int = sub v13 v14;
var v3 defined by:
  v3: int = const 1;
var v1 defined by:
  v1: int = id a;
var v11 defined by:
  v11: int = id b;
var b defined by:
  b: int = id v15;

block5 (endif.7):
var g defined by:
  g: int = id g;
var v10 defined by:
  v10: bool = eq v8 v9;
var v8 defined by:
  v8: int = id g;
var v3 defined by:
  v3: int = const 1;
var v14 defined by:
  v14: int = const 1;
var v11 defined by:
  v11: int = id b;
var v9 defined by:
  v9: int = const 1;
var v12 defined by:
  v12: int = const 0;
var b defined by:
  b: int = id v15;
var v4 defined by:
  v4: bool = ge v2 v3;
var v2 defined by:
  v2: int = id b;
var v15 defined by:
  v15: int = sub v13 v14;
var v6 defined by:
  v6: int = id b;
var v1 defined by:
  v1: int = id a;
var v5 defined by:
  v5: int = id a;
var v13 defined by:
  v13: int = id b;

block6 (for.end.0):
var v12 defined by:
  v12: int = const 0;
var v13 defined by:
  v13: int = id b;
var v14 defined by:
  v14: int = const 1;
var v8 defined by:
  v8: int = id g;
var v10 defined by:
  v10: bool = eq v8 v9;
var v11 defined by:
  v11: int = id b;
var b defined by:
  b: int = id v15;
var v4 defined by:
  v4: bool = ge v2 v3;
var v1 defined by:
  v1: int = id a;
var v15 defined by:
  v15: int = sub v13 v14;
var v5 defined by:
  v5: int = id a;
var g defined by:
  g: int = id g;
var v3 defined by:
  v3: int = const 1;
var v6 defined by:
  v6: int = id b;
var v2 defined by:
  v2: int = id b;
var v9 defined by:
  v9: int = const 1;

OUTS relative_primes
block0 (relative_primes):
var b defined by:
  b: int = id v1;
var v1 defined by:
  v1: int = id a;

block1 (for.cond.0):
var v6 defined by:
  v6: int = id b;
var v4 defined by:
  v4: bool = ge v2 v3;
var v2 defined by:
  v2: int = id b;
var v12 defined by:
  v12: int = const 0;
var v13 defined by:
  v13: int = id b;
var v14 defined by:
  v14: int = const 1;
var v11 defined by:
  v11: int = id b;
var v8 defined by:
  v8: int = id g;
var b defined by:
  b: int = id v15;
var v1 defined by:
  v1: int = id a;
var v5 defined by:
  v5: int = id a;
var v10 defined by:
  v10: bool = eq v8 v9;
var v15 defined by:
  v15: int = sub v13 v14;
var v9 defined by:
  v9: int = const 1;
var v3 defined by:
  v3: int = const 1;
var g defined by:
  g: int = id g;

block2 (for.body.0):
var v11 defined by:
  v11: int = id b;
var v6 defined by:
  v6: int = id b;
var v14 defined by:
  v14: int = const 1;
var v2 defined by:
  v2: int = id b;
var b defined by:
  b: int = id v15;
var v4 defined by:
  v4: bool = ge v2 v3;
var v9 defined by:
  v9: int = const 1;
var g defined by:
  g: int = id g;
var v12 defined by:
  v12: int = const 0;
var v10 defined by:
  v10: bool = eq v8 v9;
var v13 defined by:
  v13: int = id b;
var v8 defined by:
  v8: int = id g;
var v1 defined by:
  v1: int = id a;
var v15 defined by:
  v15: int = sub v13 v14;
var v5 defined by:
  v5: int = id a;
var v3 defined by:
  v3: int = const 1;

block3 (then.7):
var b defined by:
  b: int = id v15;
var v2 defined by:
  v2: int = id b;
var v6 defined by:
  v6: int = id b;
var v12 defined by:
  v12: int = const 0;
var v8 defined by:
  v8: int = id g;
var v3 defined by:
  v3: int = const 1;
var g defined by:
  g: int = id g;
var v5 defined by:
  v5: int = id a;
var v4 defined by:
  v4: bool = ge v2 v3;
var v1 defined by:
  v1: int = id a;
var v14 defined by:
  v14: int = const 1;
var v11 defined by:
  v11: int = id b;
var v10 defined by:
  v10: bool = eq v8 v9;
var v9 defined by:
  v9: int = const 1;
var v15 defined by:
  v15: int = sub v13 v14;
var v13 defined by:
  v13: int = id b;

block4 (else.7):
var v15 defined by:
  v15: int = sub v13 v14;
var v9 defined by:
  v9: int = const 1;
var v10 defined by:
  v10: bool = eq v8 v9;
var b defined by:
  b: int = id v15;
var v13 defined by:
  v13: int = id b;
var v2 defined by:
  v2: int = id b;
var v8 defined by:
  v8: int = id g;
var v11 defined by:
  v11: int = id b;
var v1 defined by:
  v1: int = id a;
var v6 defined by:
  v6: int = id b;
var v4 defined by:
  v4: bool = ge v2 v3;
var g defined by:
  g: int = id g;
var v12 defined by:
  v12: int = const 0;
var v5 defined by:
  v5: int = id a;
var v3 defined by:
  v3: int = const 1;
var v14 defined by:
  v14: int = const 1;

block5 (endif.7):
var v2 defined by:
  v2: int = id b;
var b defined by:
  b: int = id v15;
var v12 defined by:
  v12: int = const 0;
var v8 defined by:
  v8: int = id g;
var v11 defined by:
  v11: int = id b;
var v13 defined by:
  v13: int = id b;
var v14 defined by:
  v14: int = const 1;
var v5 defined by:
  v5: int = id a;
var v10 defined by:
  v10: bool = eq v8 v9;
var v6 defined by:
  v6: int = id b;
var v15 defined by:
  v15: int = sub v13 v14;
var g defined by:
  g: int = id g;
var v4 defined by:
  v4: bool = ge v2 v3;
var v3 defined by:
  v3: int = const 1;
var v9 defined by:
  v9: int = const 1;
var v1 defined by:
  v1: int = id a;

block6 (for.end.0):
var v5 defined by:
  v5: int = id a;
var v6 defined by:
  v6: int = id b;
var v10 defined by:
  v10: bool = eq v8 v9;
var v1 defined by:
  v1: int = id a;
var v3 defined by:
  v3: int = const 1;
var v13 defined by:
  v13: int = id b;
var v12 defined by:
  v12: int = const 0;
var v15 defined by:
  v15: int = sub v13 v14;
var g defined by:
  g: int = id g;
var v2 defined by:
  v2: int = id b;
var v9 defined by:
  v9: int = const 1;
var v11 defined by:
  v11: int = id b;
var v14 defined by:
  v14: int = const 1;
var b defined by:
  b: int = id v15;
var v4 defined by:
  v4: bool = ge v2 v3;
var v8 defined by:
  v8: int = id g;

