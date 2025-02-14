INS main
block0 (main):

OUTS main
block0 (main):
var v1 defined by:
  v1: float = id c;
var v0 defined by:
  v0: float = id n;
var c defined by:
  c: float = id c;
var v2 defined by:
  v2: int = const 0;

INS probability
block0 (probability):

block1 (for.cond.1):
var log defined by:
  log: float = id v8;
var v8 defined by:
  v8: float = fsub v6 v7;
var v17 defined by:
  v17: float = fadd v15 v16;
var v10 defined by:
  v10: float = const 365;
var v6 defined by:
  v6: float = const 365;
var v11 defined by:
  v11: float = fdiv v9 v10;
var v9 defined by:
  v9: float = id log;
var v13 defined by:
  v13: float = id logUpdated;
var i defined by:
  i: float = id v17;
var v15 defined by:
  v15: float = id i;
var v16 defined by:
  v16: float = const 1;
var logUpdated defined by:
  logUpdated: float = id v11;
var prob defined by:
  prob: float = id v14;
var v0 defined by:
  v0: float = const 1;
var v3 defined by:
  v3: float = id i;
var v4 defined by:
  v4: float = id n;
var v14 defined by:
  v14: float = fmul v12 v13;
var v12 defined by:
  v12: float = id prob;
var v5 defined by:
  v5: bool = flt v3 v4;
var v7 defined by:
  v7: float = id i;
var v2 defined by:
  v2: float = const 1;

block2 (for.body.1):
var v5 defined by:
  v5: bool = flt v3 v4;
var v6 defined by:
  v6: float = const 365;
var v0 defined by:
  v0: float = const 1;
var v4 defined by:
  v4: float = id n;
var v10 defined by:
  v10: float = const 365;
var v17 defined by:
  v17: float = fadd v15 v16;
var v12 defined by:
  v12: float = id prob;
var v11 defined by:
  v11: float = fdiv v9 v10;
var logUpdated defined by:
  logUpdated: float = id v11;
var v9 defined by:
  v9: float = id log;
var v14 defined by:
  v14: float = fmul v12 v13;
var v2 defined by:
  v2: float = const 1;
var prob defined by:
  prob: float = id v14;
var v13 defined by:
  v13: float = id logUpdated;
var v16 defined by:
  v16: float = const 1;
var v7 defined by:
  v7: float = id i;
var i defined by:
  i: float = id v17;
var log defined by:
  log: float = id v8;
var v3 defined by:
  v3: float = id i;
var v8 defined by:
  v8: float = fsub v6 v7;
var v15 defined by:
  v15: float = id i;

block3 (for.end.1):
var v0 defined by:
  v0: float = const 1;
var v16 defined by:
  v16: float = const 1;
var v4 defined by:
  v4: float = id n;
var v7 defined by:
  v7: float = id i;
var i defined by:
  i: float = id v17;
var v8 defined by:
  v8: float = fsub v6 v7;
var v10 defined by:
  v10: float = const 365;
var v2 defined by:
  v2: float = const 1;
var v3 defined by:
  v3: float = id i;
var v5 defined by:
  v5: bool = flt v3 v4;
var prob defined by:
  prob: float = id v14;
var v14 defined by:
  v14: float = fmul v12 v13;
var v9 defined by:
  v9: float = id log;
var v17 defined by:
  v17: float = fadd v15 v16;
var v12 defined by:
  v12: float = id prob;
var v13 defined by:
  v13: float = id logUpdated;
var v11 defined by:
  v11: float = fdiv v9 v10;
var v15 defined by:
  v15: float = id i;
var logUpdated defined by:
  logUpdated: float = id v11;
var v6 defined by:
  v6: float = const 365;
var log defined by:
  log: float = id v8;

OUTS probability
block0 (probability):
var i defined by:
  i: float = id v2;
var prob defined by:
  prob: float = id v0;
var v2 defined by:
  v2: float = const 1;
var v0 defined by:
  v0: float = const 1;

block1 (for.cond.1):
var v12 defined by:
  v12: float = id prob;
var v10 defined by:
  v10: float = const 365;
var v11 defined by:
  v11: float = fdiv v9 v10;
var v5 defined by:
  v5: bool = flt v3 v4;
var v14 defined by:
  v14: float = fmul v12 v13;
var i defined by:
  i: float = id v17;
var prob defined by:
  prob: float = id v14;
var v9 defined by:
  v9: float = id log;
var v17 defined by:
  v17: float = fadd v15 v16;
var log defined by:
  log: float = id v8;
var v8 defined by:
  v8: float = fsub v6 v7;
var v2 defined by:
  v2: float = const 1;
var v15 defined by:
  v15: float = id i;
var v13 defined by:
  v13: float = id logUpdated;
var logUpdated defined by:
  logUpdated: float = id v11;
var v6 defined by:
  v6: float = const 365;
var v0 defined by:
  v0: float = const 1;
var v16 defined by:
  v16: float = const 1;
var v3 defined by:
  v3: float = id i;
var v4 defined by:
  v4: float = id n;
var v7 defined by:
  v7: float = id i;

block2 (for.body.1):
var v3 defined by:
  v3: float = id i;
var v5 defined by:
  v5: bool = flt v3 v4;
var i defined by:
  i: float = id v17;
var v8 defined by:
  v8: float = fsub v6 v7;
var v4 defined by:
  v4: float = id n;
var v7 defined by:
  v7: float = id i;
var v9 defined by:
  v9: float = id log;
var v0 defined by:
  v0: float = const 1;
var prob defined by:
  prob: float = id v14;
var v12 defined by:
  v12: float = id prob;
var v14 defined by:
  v14: float = fmul v12 v13;
var v15 defined by:
  v15: float = id i;
var v16 defined by:
  v16: float = const 1;
var v6 defined by:
  v6: float = const 365;
var v17 defined by:
  v17: float = fadd v15 v16;
var log defined by:
  log: float = id v8;
var v11 defined by:
  v11: float = fdiv v9 v10;
var v13 defined by:
  v13: float = id logUpdated;
var v2 defined by:
  v2: float = const 1;
var logUpdated defined by:
  logUpdated: float = id v11;
var v10 defined by:
  v10: float = const 365;

block3 (for.end.1):
var v0 defined by:
  v0: float = const 1;
var v17 defined by:
  v17: float = fadd v15 v16;
var v16 defined by:
  v16: float = const 1;
var v8 defined by:
  v8: float = fsub v6 v7;
var v2 defined by:
  v2: float = const 1;
var v11 defined by:
  v11: float = fdiv v9 v10;
var logUpdated defined by:
  logUpdated: float = id v11;
var prob defined by:
  prob: float = id v14;
var v3 defined by:
  v3: float = id i;
var v6 defined by:
  v6: float = const 365;
var v5 defined by:
  v5: bool = flt v3 v4;
var v12 defined by:
  v12: float = id prob;
var i defined by:
  i: float = id v17;
var v7 defined by:
  v7: float = id i;
var v23 defined by:
  v23: float = fdiv v21 v22;
var log defined by:
  log: float = id v8;
var v13 defined by:
  v13: float = id logUpdated;
var v19 defined by:
  v19: float = id prob;
var v18 defined by:
  v18: float = const 1;
var v4 defined by:
  v4: float = id n;
var v10 defined by:
  v10: float = const 365;
var v21 defined by:
  v21: float = fmul v19 v20;
var v14 defined by:
  v14: float = fmul v12 v13;
var v20 defined by:
  v20: float = const 100;
var v9 defined by:
  v9: float = id log;
var v15 defined by:
  v15: float = id i;
var v22 defined by:
  v22: float = const 100;
var v24 defined by:
  v24: float = fsub v18 v23;

