INS main
block0 (main):

block1 (flip):
var a1_bigger defined by:
  a1_bigger: bool = gt a1 a2;
var res defined by:
  res: int = sub a1 a2;
var a2 defined by:
  a2: int = call @area x2 y2;
var a1 defined by:
  a1: int = call @area x1 y1;

block2 (end):
var a1_bigger defined by:
  a1_bigger: bool = gt a1 a2;
var a1 defined by:
  a1: int = call @area x1 y1;
var a2 defined by:
  a2: int = call @area x2 y2;
var res defined by:
  res: int = mul res neg1;
var neg1 defined by:
  neg1: int = const -1;

OUTS main
block0 (main):
var a1 defined by:
  a1: int = call @area x1 y1;
var a2 defined by:
  a2: int = call @area x2 y2;
var a1_bigger defined by:
  a1_bigger: bool = gt a1 a2;
var res defined by:
  res: int = sub a1 a2;

block1 (flip):
var res defined by:
  res: int = mul res neg1;
var a1 defined by:
  a1: int = call @area x1 y1;
var a1_bigger defined by:
  a1_bigger: bool = gt a1 a2;
var neg1 defined by:
  neg1: int = const -1;
var a2 defined by:
  a2: int = call @area x2 y2;

block2 (end):
var a1_bigger defined by:
  a1_bigger: bool = gt a1 a2;
var a1 defined by:
  a1: int = call @area x1 y1;
var a2 defined by:
  a2: int = call @area x2 y2;
var res defined by:
  res: int = mul res neg1;
var neg1 defined by:
  neg1: int = const -1;

INS area
block0 (area):

OUTS area
block0 (area):
var area defined by:
  area: int = mul x y;

