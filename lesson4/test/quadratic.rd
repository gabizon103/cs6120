INS main
block0 (main):

OUTS main
block0 (main):

INS sqrt
block0 (sqrt):

block1 (for.cond.0):
var v15 defined by:
  v15: int = const 1;
var v14 defined by:
  v14: int = id i;
var v1 defined by:
  v1: int = const 1;
var i defined by:
  i: int = id v16;
var v16 defined by:
  v16: int = add v14 v15;

block2 (for.body.0):
var v16 defined by:
  v16: int = add v14 v15;
var v4 defined by:
  v4: int = const 1;
var v6 defined by:
  v6: bool = lt v2 v5;
var v14 defined by:
  v14: int = id i;
var v3 defined by:
  v3: int = id x;
var v15 defined by:
  v15: int = const 1;
var i defined by:
  i: int = id v16;
var v1 defined by:
  v1: int = const 1;
var v2 defined by:
  v2: int = id i;
var v5 defined by:
  v5: int = sub v3 v4;

block3 (then.7):
var v1 defined by:
  v1: int = const 1;
var v3 defined by:
  v3: int = id x;
var v11 defined by:
  v11: int = id x;
var v12 defined by:
  v12: bool = ge v10 v11;
var v5 defined by:
  v5: int = sub v3 v4;
var i defined by:
  i: int = id v16;
var v14 defined by:
  v14: int = id i;
var v9 defined by:
  v9: int = id i;
var v10 defined by:
  v10: int = mul v8 v9;
var v8 defined by:
  v8: int = id i;
var v6 defined by:
  v6: bool = lt v2 v5;
var v15 defined by:
  v15: int = const 1;
var v2 defined by:
  v2: int = id i;
var v16 defined by:
  v16: int = add v14 v15;
var v4 defined by:
  v4: int = const 1;

block4 (else.7):
var v4 defined by:
  v4: int = const 1;
var v10 defined by:
  v10: int = mul v8 v9;
var v11 defined by:
  v11: int = id x;
var v2 defined by:
  v2: int = id i;
var v14 defined by:
  v14: int = id i;
var v8 defined by:
  v8: int = id i;
var v9 defined by:
  v9: int = id i;
var v6 defined by:
  v6: bool = lt v2 v5;
var v1 defined by:
  v1: int = const 1;
var v16 defined by:
  v16: int = add v14 v15;
var v5 defined by:
  v5: int = sub v3 v4;
var v3 defined by:
  v3: int = id x;
var v12 defined by:
  v12: bool = ge v10 v11;
var v15 defined by:
  v15: int = const 1;
var i defined by:
  i: int = id v16;

block5 (endif.7):

block6 (for.end.0):
var v6 defined by:
  v6: bool = lt v2 v5;
var v5 defined by:
  v5: int = sub v3 v4;
var v16 defined by:
  v16: int = add v14 v15;
var v15 defined by:
  v15: int = const 1;
var v4 defined by:
  v4: int = const 1;
var v14 defined by:
  v14: int = id i;
var v1 defined by:
  v1: int = const 1;
var v2 defined by:
  v2: int = id i;
var i defined by:
  i: int = id v16;
var v3 defined by:
  v3: int = id x;

OUTS sqrt
block0 (sqrt):
var i defined by:
  i: int = id v1;
var v1 defined by:
  v1: int = const 1;

block1 (for.cond.0):
var v4 defined by:
  v4: int = const 1;
var v3 defined by:
  v3: int = id x;
var i defined by:
  i: int = id v16;
var v6 defined by:
  v6: bool = lt v2 v5;
var v14 defined by:
  v14: int = id i;
var v5 defined by:
  v5: int = sub v3 v4;
var v15 defined by:
  v15: int = const 1;
var v16 defined by:
  v16: int = add v14 v15;
var v1 defined by:
  v1: int = const 1;
var v2 defined by:
  v2: int = id i;

block2 (for.body.0):
var v3 defined by:
  v3: int = id x;
var v4 defined by:
  v4: int = const 1;
var v16 defined by:
  v16: int = add v14 v15;
var v8 defined by:
  v8: int = id i;
var v9 defined by:
  v9: int = id i;
var v6 defined by:
  v6: bool = lt v2 v5;
var v11 defined by:
  v11: int = id x;
var v1 defined by:
  v1: int = const 1;
var v12 defined by:
  v12: bool = ge v10 v11;
var v5 defined by:
  v5: int = sub v3 v4;
var v10 defined by:
  v10: int = mul v8 v9;
var v2 defined by:
  v2: int = id i;
var v15 defined by:
  v15: int = const 1;
var v14 defined by:
  v14: int = id i;
var i defined by:
  i: int = id v16;

block3 (then.7):
var v10 defined by:
  v10: int = mul v8 v9;
var v9 defined by:
  v9: int = id i;
var v8 defined by:
  v8: int = id i;
var v16 defined by:
  v16: int = add v14 v15;
var v15 defined by:
  v15: int = const 1;
var v6 defined by:
  v6: bool = lt v2 v5;
var v11 defined by:
  v11: int = id x;
var v12 defined by:
  v12: bool = ge v10 v11;
var i defined by:
  i: int = id v16;
var v14 defined by:
  v14: int = id i;
var v5 defined by:
  v5: int = sub v3 v4;
var v2 defined by:
  v2: int = id i;
var v3 defined by:
  v3: int = id x;
var v1 defined by:
  v1: int = const 1;
var v4 defined by:
  v4: int = const 1;
var v13 defined by:
  v13: int = id i;

block4 (else.7):
var v8 defined by:
  v8: int = id i;
var v6 defined by:
  v6: bool = lt v2 v5;
var i defined by:
  i: int = id v16;
var v11 defined by:
  v11: int = id x;
var v14 defined by:
  v14: int = id i;
var v15 defined by:
  v15: int = const 1;
var v1 defined by:
  v1: int = const 1;
var v12 defined by:
  v12: bool = ge v10 v11;
var v3 defined by:
  v3: int = id x;
var v9 defined by:
  v9: int = id i;
var v10 defined by:
  v10: int = mul v8 v9;
var v5 defined by:
  v5: int = sub v3 v4;
var v16 defined by:
  v16: int = add v14 v15;
var v4 defined by:
  v4: int = const 1;
var v2 defined by:
  v2: int = id i;

block5 (endif.7):
var i defined by:
  i: int = id v16;
var v14 defined by:
  v14: int = id i;
var v15 defined by:
  v15: int = const 1;
var v16 defined by:
  v16: int = add v14 v15;

block6 (for.end.0):
var v2 defined by:
  v2: int = id i;
var v1 defined by:
  v1: int = const 1;
var v15 defined by:
  v15: int = const 1;
var v3 defined by:
  v3: int = id x;
var v5 defined by:
  v5: int = sub v3 v4;
var v4 defined by:
  v4: int = const 1;
var i defined by:
  i: int = id v16;
var v14 defined by:
  v14: int = id i;
var v16 defined by:
  v16: int = add v14 v15;
var v17 defined by:
  v17: int = const 0;
var v6 defined by:
  v6: bool = lt v2 v5;

INS quadratic
block0 (quadratic):

OUTS quadratic
block0 (quadratic):
var v25 defined by:
  v25: int = id d;
var v26 defined by:
  v26: int = div v24 v25;
var v16 defined by:
  v16: int = call @sqrt v15;
var v8 defined by:
  v8: int = sub v2 v7;
var v30 defined by:
  v30: int = div v28 v29;
var v31 defined by:
  v31: int = const 0;
var v17 defined by:
  v17: int = add v14 v16;
var v18 defined by:
  v18: int = const 0;
var v13 defined by:
  v13: int = id b;
var r1 defined by:
  r1: int = id v17;
var v5 defined by:
  v5: int = mul v3 v4;
var v10 defined by:
  v10: int = id a;
var v12 defined by:
  v12: int = const 0;
var r2 defined by:
  r2: int = id v23;
var v0 defined by:
  v0: int = id b;
var v9 defined by:
  v9: int = const 2;
var v11 defined by:
  v11: int = mul v9 v10;
var s defined by:
  s: int = id v8;
var v21 defined by:
  v21: int = id s;
var v7 defined by:
  v7: int = mul v5 v6;
var v14 defined by:
  v14: int = sub v12 v13;
var v29 defined by:
  v29: int = id d;
var v28 defined by:
  v28: int = id r2;
var v19 defined by:
  v19: int = id b;
var v1 defined by:
  v1: int = id b;
var v15 defined by:
  v15: int = id s;
var v27 defined by:
  v27: int = const 0;
var d defined by:
  d: int = id v11;
var v24 defined by:
  v24: int = id r1;
var v23 defined by:
  v23: int = sub v20 v22;
var v3 defined by:
  v3: int = const 4;
var v2 defined by:
  v2: int = mul v0 v1;
var v4 defined by:
  v4: int = id a;
var v22 defined by:
  v22: int = call @sqrt v21;
var v20 defined by:
  v20: int = sub v18 v19;
var v6 defined by:
  v6: int = id c;

