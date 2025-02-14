INS main
block0 (main):

OUTS main
block0 (main):
var tot defined by:
  tot: int = call @totient n;

INS totient
block0 (totient):

block1 (for.set.cond):
var cond defined by:
  cond: bool = le pp n;
var n defined by:
  n: int = id npdiv;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var npdiv defined by:
  npdiv: int = div n p;
var npmod defined by:
  npmod: int = call @mod n p;
var result defined by:
  result: int = sub result resdiv;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var resdiv defined by:
  resdiv: int = div result p;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var p defined by:
  p: int = add p one;
var pp defined by:
  pp: int = mul p p;

block2 (for.set.body):
var n defined by:
  n: int = id npdiv;
var resdiv defined by:
  resdiv: int = div result p;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var npdiv defined by:
  npdiv: int = div n p;
var npmod defined by:
  npmod: int = call @mod n p;
var result defined by:
  result: int = sub result resdiv;
var one defined by:
  one: int = const 1;
var cond defined by:
  cond: bool = le pp n;
var p defined by:
  p: int = add p one;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var pp defined by:
  pp: int = mul p p;
var zero defined by:
  zero: int = const 0;

block3 (if_lbl):
var one defined by:
  one: int = const 1;
var pp defined by:
  pp: int = mul p p;
var resdiv defined by:
  resdiv: int = div result p;
var n defined by:
  n: int = id npdiv;
var result defined by:
  result: int = sub result resdiv;
var cond defined by:
  cond: bool = le pp n;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var zero defined by:
  zero: int = const 0;
var npdiv defined by:
  npdiv: int = div n p;
var p defined by:
  p: int = add p one;
var npmod defined by:
  npmod: int = call @mod n p;

block4 (while.set.cond):
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var n defined by:
  n: int = id npdiv;
var npmod defined by:
  npmod: int = call @mod n p;
var npdiv defined by:
  npdiv: int = div n p;

block5 (while.body):
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var npmod defined by:
  npmod: int = call @mod n p;
var npdiv defined by:
  npdiv: int = div n p;
var n defined by:
  n: int = id npdiv;

block6 (while.end):
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var npdiv defined by:
  npdiv: int = div n p;
var npmod defined by:
  npmod: int = call @mod n p;
var n defined by:
  n: int = id npdiv;

block7 (else_lbl):
var n defined by:
  n: int = id npdiv;
var p defined by:
  p: int = add p one;
var npdiv defined by:
  npdiv: int = div n p;
var npmod defined by:
  npmod: int = call @mod n p;
var resdiv defined by:
  resdiv: int = div result p;
var pp defined by:
  pp: int = mul p p;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var result defined by:
  result: int = sub result resdiv;
var zero defined by:
  zero: int = const 0;
var cond defined by:
  cond: bool = le pp n;
var one defined by:
  one: int = const 1;
var if_cond defined by:
  if_cond: bool = eq npmod zero;

block8 (for.set.end):
var cond defined by:
  cond: bool = le pp n;
var npmod defined by:
  npmod: int = call @mod n p;
var result defined by:
  result: int = sub result resdiv;
var n defined by:
  n: int = id npdiv;
var resdiv defined by:
  resdiv: int = div result p;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var npdiv defined by:
  npdiv: int = div n p;
var pp defined by:
  pp: int = mul p p;
var zero defined by:
  zero: int = const 0;
var p defined by:
  p: int = add p one;
var one defined by:
  one: int = const 1;
var while_cond defined by:
  while_cond: bool = eq npmod zero;

block9 (final_if_label):
var pp defined by:
  pp: int = mul p p;
var one defined by:
  one: int = const 1;
var resdiv defined by:
  resdiv: int = div result p;
var cond defined by:
  cond: bool = le pp n;
var npmod defined by:
  npmod: int = call @mod n p;
var npdiv defined by:
  npdiv: int = div n p;
var p defined by:
  p: int = add p one;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var zero defined by:
  zero: int = const 0;
var result defined by:
  result: int = sub result resdiv;
var final_if_cond defined by:
  final_if_cond: bool = gt n one;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var n defined by:
  n: int = id npdiv;

block10 (final_else_label):
var cond defined by:
  cond: bool = le pp n;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var one defined by:
  one: int = const 1;
var n defined by:
  n: int = id npdiv;
var zero defined by:
  zero: int = const 0;
var pp defined by:
  pp: int = mul p p;
var resdiv defined by:
  resdiv: int = div result p;
var p defined by:
  p: int = add p one;
var npdiv defined by:
  npdiv: int = div n p;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var npmod defined by:
  npmod: int = call @mod n p;
var result defined by:
  result: int = sub result resdiv;
var final_if_cond defined by:
  final_if_cond: bool = gt n one;

OUTS totient
block0 (totient):
var p defined by:
  p: int = const 2;
var result defined by:
  result: int = id n;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;

block1 (for.set.cond):
var cond defined by:
  cond: bool = le pp n;
var n defined by:
  n: int = id npdiv;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var npdiv defined by:
  npdiv: int = div n p;
var npmod defined by:
  npmod: int = call @mod n p;
var result defined by:
  result: int = sub result resdiv;
var zero defined by:
  zero: int = const 0;
var one defined by:
  one: int = const 1;
var resdiv defined by:
  resdiv: int = div result p;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var p defined by:
  p: int = add p one;
var pp defined by:
  pp: int = mul p p;

block2 (for.set.body):
var cond defined by:
  cond: bool = le pp n;
var result defined by:
  result: int = sub result resdiv;
var resdiv defined by:
  resdiv: int = div result p;
var p defined by:
  p: int = add p one;
var n defined by:
  n: int = id npdiv;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var zero defined by:
  zero: int = const 0;
var npdiv defined by:
  npdiv: int = div n p;
var npmod defined by:
  npmod: int = call @mod n p;
var one defined by:
  one: int = const 1;
var pp defined by:
  pp: int = mul p p;

block3 (if_lbl):
var one defined by:
  one: int = const 1;
var pp defined by:
  pp: int = mul p p;
var resdiv defined by:
  resdiv: int = div result p;
var n defined by:
  n: int = id npdiv;
var result defined by:
  result: int = sub result resdiv;
var cond defined by:
  cond: bool = le pp n;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var zero defined by:
  zero: int = const 0;
var npdiv defined by:
  npdiv: int = div n p;
var p defined by:
  p: int = add p one;
var npmod defined by:
  npmod: int = call @mod n p;

block4 (while.set.cond):
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var n defined by:
  n: int = id npdiv;
var npmod defined by:
  npmod: int = call @mod n p;
var npdiv defined by:
  npdiv: int = div n p;

block5 (while.body):
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var npdiv defined by:
  npdiv: int = div n p;
var npmod defined by:
  npmod: int = call @mod n p;
var n defined by:
  n: int = id npdiv;

block6 (while.end):
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var npdiv defined by:
  npdiv: int = div n p;
var result defined by:
  result: int = sub result resdiv;
var resdiv defined by:
  resdiv: int = div result p;
var npmod defined by:
  npmod: int = call @mod n p;
var n defined by:
  n: int = id npdiv;

block7 (else_lbl):
var p defined by:
  p: int = add p one;
var resdiv defined by:
  resdiv: int = div result p;
var pp defined by:
  pp: int = mul p p;
var npmod defined by:
  npmod: int = call @mod n p;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var n defined by:
  n: int = id npdiv;
var zero defined by:
  zero: int = const 0;
var result defined by:
  result: int = sub result resdiv;
var one defined by:
  one: int = const 1;
var cond defined by:
  cond: bool = le pp n;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var npdiv defined by:
  npdiv: int = div n p;

block8 (for.set.end):
var npdiv defined by:
  npdiv: int = div n p;
var resdiv defined by:
  resdiv: int = div result p;
var cond defined by:
  cond: bool = le pp n;
var pp defined by:
  pp: int = mul p p;
var npmod defined by:
  npmod: int = call @mod n p;
var n defined by:
  n: int = id npdiv;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var zero defined by:
  zero: int = const 0;
var result defined by:
  result: int = sub result resdiv;
var one defined by:
  one: int = const 1;
var p defined by:
  p: int = add p one;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var final_if_cond defined by:
  final_if_cond: bool = gt n one;

block9 (final_if_label):
var pp defined by:
  pp: int = mul p p;
var one defined by:
  one: int = const 1;
var resdiv defined by:
  resdiv: int = div result n;
var cond defined by:
  cond: bool = le pp n;
var npmod defined by:
  npmod: int = call @mod n p;
var npdiv defined by:
  npdiv: int = div n p;
var p defined by:
  p: int = add p one;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var zero defined by:
  zero: int = const 0;
var result defined by:
  result: int = sub result resdiv;
var final_if_cond defined by:
  final_if_cond: bool = gt n one;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var n defined by:
  n: int = id npdiv;

block10 (final_else_label):
var cond defined by:
  cond: bool = le pp n;
var if_cond defined by:
  if_cond: bool = eq npmod zero;
var one defined by:
  one: int = const 1;
var n defined by:
  n: int = id npdiv;
var zero defined by:
  zero: int = const 0;
var pp defined by:
  pp: int = mul p p;
var resdiv defined by:
  resdiv: int = div result p;
var p defined by:
  p: int = add p one;
var npdiv defined by:
  npdiv: int = div n p;
var while_cond defined by:
  while_cond: bool = eq npmod zero;
var npmod defined by:
  npmod: int = call @mod n p;
var result defined by:
  result: int = sub result resdiv;
var final_if_cond defined by:
  final_if_cond: bool = gt n one;

INS mod
block0 (mod):

OUTS mod
block0 (mod):
var ans defined by:
  ans: int = sub a mad;
var ad defined by:
  ad: int = div a b;
var mad defined by:
  mad: int = mul b ad;

