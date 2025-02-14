INS main
block0 (main):

block1 (cmp.val):
var v4 defined by:
  v4: bool = eq v3 vc0;
var vc0 defined by:
  vc0: int = const 0;
var v2 defined by:
  v2: bool = lt v0 v1;
var v3 defined by:
  v3: int = sub v0 v1;
var v0 defined by:
  v0: int = id v3;
var v1 defined by:
  v1: int = id v3;

block2 (if.1):
var vc0 defined by:
  vc0: int = const 0;
var v0 defined by:
  v0: int = id v3;
var v1 defined by:
  v1: int = id v3;
var v2 defined by:
  v2: bool = lt v0 v1;
var v3 defined by:
  v3: int = sub v0 v1;
var v4 defined by:
  v4: bool = eq v3 vc0;

block3 (else.1):
var vc0 defined by:
  vc0: int = const 0;
var v2 defined by:
  v2: bool = lt v0 v1;
var v1 defined by:
  v1: int = id v3;
var v3 defined by:
  v3: int = sub v0 v1;
var v0 defined by:
  v0: int = id v3;
var v4 defined by:
  v4: bool = eq v3 vc0;

block4 (loop.bound):
var v3 defined by:
  v3: int = sub v0 v1;
var v1 defined by:
  v1: int = id v3;
var v4 defined by:
  v4: bool = eq v3 vc0;
var vc0 defined by:
  vc0: int = const 0;
var v0 defined by:
  v0: int = id v3;
var v2 defined by:
  v2: bool = lt v0 v1;

block5 (update.val):
var v2 defined by:
  v2: bool = lt v0 v1;
var v4 defined by:
  v4: bool = eq v3 vc0;
var v1 defined by:
  v1: int = id v3;
var vc0 defined by:
  vc0: int = const 0;
var v0 defined by:
  v0: int = id v3;
var v3 defined by:
  v3: int = sub v0 v1;

block6 (if.2):
var vc0 defined by:
  vc0: int = const 0;
var v3 defined by:
  v3: int = sub v0 v1;
var v4 defined by:
  v4: bool = eq v3 vc0;
var v1 defined by:
  v1: int = id v3;
var v2 defined by:
  v2: bool = lt v0 v1;
var v0 defined by:
  v0: int = id v3;

block7 (else.2):
var v2 defined by:
  v2: bool = lt v0 v1;
var vc0 defined by:
  vc0: int = const 0;
var v4 defined by:
  v4: bool = eq v3 vc0;
var v1 defined by:
  v1: int = id v3;
var v0 defined by:
  v0: int = id v3;
var v3 defined by:
  v3: int = sub v0 v1;

block8 (program.end):
var v4 defined by:
  v4: bool = eq v3 vc0;
var v0 defined by:
  v0: int = id v3;
var v2 defined by:
  v2: bool = lt v0 v1;
var vc0 defined by:
  vc0: int = const 0;
var v3 defined by:
  v3: int = sub v0 v1;
var v1 defined by:
  v1: int = id v3;

OUTS main
block0 (main):
var v0 defined by:
  v0: int = id op1;
var v1 defined by:
  v1: int = id op2;
var vc0 defined by:
  vc0: int = const 0;

block1 (cmp.val):
var v2 defined by:
  v2: bool = lt v0 v1;
var v0 defined by:
  v0: int = id v3;
var v1 defined by:
  v1: int = id v3;
var v3 defined by:
  v3: int = sub v0 v1;
var v4 defined by:
  v4: bool = eq v3 vc0;
var vc0 defined by:
  vc0: int = const 0;

block2 (if.1):
var v3 defined by:
  v3: int = sub v1 v0;
var v0 defined by:
  v0: int = id v3;
var v1 defined by:
  v1: int = id v3;
var v4 defined by:
  v4: bool = eq v3 vc0;
var v2 defined by:
  v2: bool = lt v0 v1;
var vc0 defined by:
  vc0: int = const 0;

block3 (else.1):
var v2 defined by:
  v2: bool = lt v0 v1;
var v4 defined by:
  v4: bool = eq v3 vc0;
var v1 defined by:
  v1: int = id v3;
var v3 defined by:
  v3: int = sub v0 v1;
var vc0 defined by:
  vc0: int = const 0;
var v0 defined by:
  v0: int = id v3;

block4 (loop.bound):
var v4 defined by:
  v4: bool = eq v3 vc0;
var vc0 defined by:
  vc0: int = const 0;
var v0 defined by:
  v0: int = id v3;
var v3 defined by:
  v3: int = sub v0 v1;
var v1 defined by:
  v1: int = id v3;
var v2 defined by:
  v2: bool = lt v0 v1;

block5 (update.val):
var v2 defined by:
  v2: bool = lt v0 v1;
var v4 defined by:
  v4: bool = eq v3 vc0;
var v1 defined by:
  v1: int = id v3;
var vc0 defined by:
  vc0: int = const 0;
var v0 defined by:
  v0: int = id v3;
var v3 defined by:
  v3: int = sub v0 v1;

block6 (if.2):
var vc0 defined by:
  vc0: int = const 0;
var v3 defined by:
  v3: int = sub v0 v1;
var v4 defined by:
  v4: bool = eq v3 vc0;
var v1 defined by:
  v1: int = id v3;
var v2 defined by:
  v2: bool = lt v0 v1;
var v0 defined by:
  v0: int = id v3;

block7 (else.2):
var vc0 defined by:
  vc0: int = const 0;
var v3 defined by:
  v3: int = sub v0 v1;
var v1 defined by:
  v1: int = id v3;
var v0 defined by:
  v0: int = id v3;
var v2 defined by:
  v2: bool = lt v0 v1;
var v4 defined by:
  v4: bool = eq v3 vc0;

block8 (program.end):
var v4 defined by:
  v4: bool = eq v3 vc0;
var v0 defined by:
  v0: int = id v3;
var v2 defined by:
  v2: bool = lt v0 v1;
var vc0 defined by:
  vc0: int = const 0;
var v3 defined by:
  v3: int = sub v0 v1;
var v1 defined by:
  v1: int = id v3;

