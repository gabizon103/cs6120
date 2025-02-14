INS main
block0 (main):

OUTS main
block0 (main):
var output defined by:
  output: bool = call @fitsInside width1 height1 width2 height2;

INS fitsInside
block0 (fitsInside):

OUTS fitsInside
block0 (fitsInside):
var ret_val defined by:
  ret_val: bool = or first_check second_check;
var first_check defined by:
  first_check: bool = and width_check height_check;
var width_check defined by:
  width_check: bool = le w1 w2;
var height_check defined by:
  height_check: bool = le h1 h2;
var heightwidth_check defined by:
  heightwidth_check: bool = le h1 w2;
var second_check defined by:
  second_check: bool = and widthheight_check heightwidth_check;
var widthheight_check defined by:
  widthheight_check: bool = le w1 h2;

