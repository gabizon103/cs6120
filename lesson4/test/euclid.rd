INS main
block0 (main):

OUTS main
block0 (main):
var v4 defined by:
  v4: int = id f;
var v1 defined by:
  v1: int = const 1748698766;
var v5 defined by:
  v5: int = const 0;
var f defined by:
  f: int = id f;
var v2 defined by:
  v2: int = id x;
var x defined by:
  x: int = id v0;
var v3 defined by:
  v3: int = id y;
var y defined by:
  y: int = id v1;
var v0 defined by:
  v0: int = const 23789216;

INS mod
block0 (mod):

OUTS mod
block0 (mod):
var v0 defined by:
  v0: int = id r;
var v4 defined by:
  v4: int = id s;
var v2 defined by:
  v2: int = id s;
var result defined by:
  result: int = id v6;
var v7 defined by:
  v7: int = id result;
var v6 defined by:
  v6: int = sub v0 v5;
var v1 defined by:
  v1: int = id r;
var v3 defined by:
  v3: int = div v1 v2;
var v5 defined by:
  v5: int = mul v3 v4;

INS gcd
block0 (gcd):

block1 (for.cond.5):
var v13 defined by:
  v13: int = id zero;
var v6 defined by:
  v6: bool = id cond;
var v9 defined by:
  v9: int = id b;
var v1 defined by:
  v1: int = id b;
var b defined by:
  b: int = id v10;
var v3 defined by:
  v3: bool = eq v1 v2;
var v2 defined by:
  v2: int = id zero;
var a defined by:
  a: int = id v11;
var v12 defined by:
  v12: int = id b;
var v10 defined by:
  v10: int = call @mod v8 v9;
var cond defined by:
  cond: bool = id v15;
var temp defined by:
  temp: int = id v7;
var v7 defined by:
  v7: int = id b;
var v15 defined by:
  v15: bool = not cond_temp;
var cond_temp defined by:
  cond_temp: bool = id v14;
var v8 defined by:
  v8: int = id a;
var v4 defined by:
  v4: bool = not cond_temp;
var v0 defined by:
  v0: int = const 0;
var v11 defined by:
  v11: int = id temp;
var v14 defined by:
  v14: bool = eq v12 v13;
var zero defined by:
  zero: int = id v0;

block2 (for.body.5):
var v0 defined by:
  v0: int = const 0;
var v4 defined by:
  v4: bool = not cond_temp;
var v14 defined by:
  v14: bool = eq v12 v13;
var v1 defined by:
  v1: int = id b;
var v6 defined by:
  v6: bool = id cond;
var v10 defined by:
  v10: int = call @mod v8 v9;
var cond_temp defined by:
  cond_temp: bool = id v14;
var zero defined by:
  zero: int = id v0;
var v8 defined by:
  v8: int = id a;
var v11 defined by:
  v11: int = id temp;
var v12 defined by:
  v12: int = id b;
var cond defined by:
  cond: bool = id v15;
var v13 defined by:
  v13: int = id zero;
var v2 defined by:
  v2: int = id zero;
var v7 defined by:
  v7: int = id b;
var b defined by:
  b: int = id v10;
var v3 defined by:
  v3: bool = eq v1 v2;
var a defined by:
  a: int = id v11;
var v9 defined by:
  v9: int = id b;
var temp defined by:
  temp: int = id v7;
var v15 defined by:
  v15: bool = not cond_temp;

block3 (for.end.5):
var temp defined by:
  temp: int = id v7;
var v11 defined by:
  v11: int = id temp;
var v14 defined by:
  v14: bool = eq v12 v13;
var v1 defined by:
  v1: int = id b;
var zero defined by:
  zero: int = id v0;
var v6 defined by:
  v6: bool = id cond;
var b defined by:
  b: int = id v10;
var v10 defined by:
  v10: int = call @mod v8 v9;
var cond defined by:
  cond: bool = id v15;
var v7 defined by:
  v7: int = id b;
var v9 defined by:
  v9: int = id b;
var v8 defined by:
  v8: int = id a;
var v2 defined by:
  v2: int = id zero;
var v0 defined by:
  v0: int = const 0;
var v3 defined by:
  v3: bool = eq v1 v2;
var v12 defined by:
  v12: int = id b;
var v4 defined by:
  v4: bool = not cond_temp;
var cond_temp defined by:
  cond_temp: bool = id v14;
var v15 defined by:
  v15: bool = not cond_temp;
var v13 defined by:
  v13: int = id zero;
var a defined by:
  a: int = id v11;

OUTS gcd
block0 (gcd):
var v0 defined by:
  v0: int = const 0;
var zero defined by:
  zero: int = id v0;
var v4 defined by:
  v4: bool = not cond_temp;
var v3 defined by:
  v3: bool = eq v1 v2;
var v1 defined by:
  v1: int = id b;
var cond defined by:
  cond: bool = id v4;
var cond_temp defined by:
  cond_temp: bool = id v3;
var v2 defined by:
  v2: int = id zero;

block1 (for.cond.5):
var v13 defined by:
  v13: int = id zero;
var v6 defined by:
  v6: bool = id cond;
var v9 defined by:
  v9: int = id b;
var v1 defined by:
  v1: int = id b;
var b defined by:
  b: int = id v10;
var v3 defined by:
  v3: bool = eq v1 v2;
var v2 defined by:
  v2: int = id zero;
var a defined by:
  a: int = id v11;
var v12 defined by:
  v12: int = id b;
var v10 defined by:
  v10: int = call @mod v8 v9;
var cond defined by:
  cond: bool = id v15;
var temp defined by:
  temp: int = id v7;
var v7 defined by:
  v7: int = id b;
var v15 defined by:
  v15: bool = not cond_temp;
var cond_temp defined by:
  cond_temp: bool = id v14;
var v8 defined by:
  v8: int = id a;
var v4 defined by:
  v4: bool = not cond_temp;
var v0 defined by:
  v0: int = const 0;
var v11 defined by:
  v11: int = id temp;
var v14 defined by:
  v14: bool = eq v12 v13;
var zero defined by:
  zero: int = id v0;

block2 (for.body.5):
var v11 defined by:
  v11: int = id temp;
var v4 defined by:
  v4: bool = not cond_temp;
var v2 defined by:
  v2: int = id zero;
var v13 defined by:
  v13: int = id zero;
var v0 defined by:
  v0: int = const 0;
var v14 defined by:
  v14: bool = eq v12 v13;
var v15 defined by:
  v15: bool = not cond_temp;
var v10 defined by:
  v10: int = call @mod v8 v9;
var a defined by:
  a: int = id v11;
var zero defined by:
  zero: int = id v0;
var temp defined by:
  temp: int = id v7;
var v1 defined by:
  v1: int = id b;
var b defined by:
  b: int = id v10;
var v12 defined by:
  v12: int = id b;
var v7 defined by:
  v7: int = id b;
var v9 defined by:
  v9: int = id b;
var v3 defined by:
  v3: bool = eq v1 v2;
var v6 defined by:
  v6: bool = id cond;
var cond defined by:
  cond: bool = id v15;
var v8 defined by:
  v8: int = id a;
var cond_temp defined by:
  cond_temp: bool = id v14;

block3 (for.end.5):
var v1 defined by:
  v1: int = id b;
var v4 defined by:
  v4: bool = not cond_temp;
var v2 defined by:
  v2: int = id zero;
var v6 defined by:
  v6: bool = id cond;
var cond defined by:
  cond: bool = id v15;
var v0 defined by:
  v0: int = const 0;
var v14 defined by:
  v14: bool = eq v12 v13;
var v10 defined by:
  v10: int = call @mod v8 v9;
var temp defined by:
  temp: int = id v7;
var v7 defined by:
  v7: int = id b;
var v3 defined by:
  v3: bool = eq v1 v2;
var v13 defined by:
  v13: int = id zero;
var cond_temp defined by:
  cond_temp: bool = id v14;
var b defined by:
  b: int = id v10;
var v8 defined by:
  v8: int = id a;
var v12 defined by:
  v12: int = id b;
var v15 defined by:
  v15: bool = not cond_temp;
var v16 defined by:
  v16: int = id a;
var a defined by:
  a: int = id v11;
var v9 defined by:
  v9: int = id b;
var zero defined by:
  zero: int = id v0;
var v11 defined by:
  v11: int = id temp;

