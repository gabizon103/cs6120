INS main
block0 (main):

OUTS main
block0 (main):
var tmp0 defined by:
  tmp0: bool = call @is_decreasing x;
var tmp defined by:
  tmp: bool = id tmp0;

INS is_decreasing
block0 (is_decreasing):

block1 (label4):
var tmp1 defined by:
  tmp1: int = const 1;
var tmp7 defined by:
  tmp7: int = const 0;
var tmp9 defined by:
  tmp9: int = call @last_digit tmp;
var tmp15 defined by:
  tmp15: int = const 10;
var prev defined by:
  prev: int = id digit;
var tmp16 defined by:
  tmp16: int = div tmp tmp15;
var tmp8 defined by:
  tmp8: bool = gt tmp tmp7;
var tmp2 defined by:
  tmp2: int = const -1;
var tmp10 defined by:
  tmp10: bool = lt digit prev;
var tmp defined by:
  tmp: int = id tmp16;
var digit defined by:
  digit: int = id tmp9;
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;

block2 (label5):
var tmp10 defined by:
  tmp10: bool = lt digit prev;
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;
var tmp1 defined by:
  tmp1: int = const 1;
var tmp9 defined by:
  tmp9: int = call @last_digit tmp;
var prev defined by:
  prev: int = id digit;
var tmp7 defined by:
  tmp7: int = const 0;
var tmp15 defined by:
  tmp15: int = const 10;
var tmp defined by:
  tmp: int = id tmp16;
var tmp2 defined by:
  tmp2: int = const -1;
var tmp16 defined by:
  tmp16: int = div tmp tmp15;
var digit defined by:
  digit: int = id tmp9;
var tmp8 defined by:
  tmp8: bool = gt tmp tmp7;

block3 (label11):
var tmp1 defined by:
  tmp1: int = const 1;
var tmp defined by:
  tmp: int = id tmp16;
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;
var tmp9 defined by:
  tmp9: int = call @last_digit tmp;
var tmp7 defined by:
  tmp7: int = const 0;
var tmp16 defined by:
  tmp16: int = div tmp tmp15;
var tmp8 defined by:
  tmp8: bool = gt tmp tmp7;
var tmp10 defined by:
  tmp10: bool = lt digit prev;
var prev defined by:
  prev: int = id digit;
var tmp2 defined by:
  tmp2: int = const -1;
var digit defined by:
  digit: int = id tmp9;
var tmp15 defined by:
  tmp15: int = const 10;

block4 ():

block5 (label12):
var tmp15 defined by:
  tmp15: int = const 10;
var tmp9 defined by:
  tmp9: int = call @last_digit tmp;
var tmp2 defined by:
  tmp2: int = const -1;
var tmp10 defined by:
  tmp10: bool = lt digit prev;
var tmp16 defined by:
  tmp16: int = div tmp tmp15;
var prev defined by:
  prev: int = id digit;
var tmp1 defined by:
  tmp1: int = const 1;
var tmp8 defined by:
  tmp8: bool = gt tmp tmp7;
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;
var tmp7 defined by:
  tmp7: int = const 0;
var tmp defined by:
  tmp: int = id tmp16;
var digit defined by:
  digit: int = id tmp9;

block6 (label13):
var tmp7 defined by:
  tmp7: int = const 0;
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;
var tmp8 defined by:
  tmp8: bool = gt tmp tmp7;
var tmp10 defined by:
  tmp10: bool = lt digit prev;
var tmp1 defined by:
  tmp1: int = const 1;
var digit defined by:
  digit: int = id tmp9;
var tmp16 defined by:
  tmp16: int = div tmp tmp15;
var tmp9 defined by:
  tmp9: int = call @last_digit tmp;
var tmp defined by:
  tmp: int = id tmp16;
var tmp15 defined by:
  tmp15: int = const 10;
var tmp2 defined by:
  tmp2: int = const -1;
var prev defined by:
  prev: int = id digit;

block7 (label6):
var tmp2 defined by:
  tmp2: int = const -1;
var tmp7 defined by:
  tmp7: int = const 0;
var tmp9 defined by:
  tmp9: int = call @last_digit tmp;
var tmp15 defined by:
  tmp15: int = const 10;
var tmp defined by:
  tmp: int = id tmp16;
var tmp10 defined by:
  tmp10: bool = lt digit prev;
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;
var tmp1 defined by:
  tmp1: int = const 1;
var tmp8 defined by:
  tmp8: bool = gt tmp tmp7;
var tmp16 defined by:
  tmp16: int = div tmp tmp15;
var digit defined by:
  digit: int = id tmp9;
var prev defined by:
  prev: int = id digit;

OUTS is_decreasing
block0 (is_decreasing):
var tmp1 defined by:
  tmp1: int = const 1;
var tmp2 defined by:
  tmp2: int = const -1;
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;
var tmp defined by:
  tmp: int = id x;
var prev defined by:
  prev: int = id tmp3;

block1 (label4):
var tmp9 defined by:
  tmp9: int = call @last_digit tmp;
var digit defined by:
  digit: int = id tmp9;
var prev defined by:
  prev: int = id digit;
var tmp10 defined by:
  tmp10: bool = lt digit prev;
var tmp8 defined by:
  tmp8: bool = gt tmp tmp7;
var tmp defined by:
  tmp: int = id tmp16;
var tmp16 defined by:
  tmp16: int = div tmp tmp15;
var tmp15 defined by:
  tmp15: int = const 10;
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;
var tmp1 defined by:
  tmp1: int = const 1;
var tmp7 defined by:
  tmp7: int = const 0;
var tmp2 defined by:
  tmp2: int = const -1;

block2 (label5):
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;
var tmp15 defined by:
  tmp15: int = const 10;
var tmp1 defined by:
  tmp1: int = const 1;
var prev defined by:
  prev: int = id digit;
var tmp7 defined by:
  tmp7: int = const 0;
var tmp9 defined by:
  tmp9: int = call @last_digit tmp;
var tmp2 defined by:
  tmp2: int = const -1;
var tmp16 defined by:
  tmp16: int = div tmp tmp15;
var tmp10 defined by:
  tmp10: bool = lt digit prev;
var tmp8 defined by:
  tmp8: bool = gt tmp tmp7;
var tmp defined by:
  tmp: int = id tmp16;
var digit defined by:
  digit: int = id tmp9;

block3 (label11):
var tmp9 defined by:
  tmp9: int = call @last_digit tmp;
var tmp7 defined by:
  tmp7: int = const 0;
var tmp10 defined by:
  tmp10: bool = lt digit prev;
var tmp1 defined by:
  tmp1: int = const 1;
var prev defined by:
  prev: int = id digit;
var tmp8 defined by:
  tmp8: bool = gt tmp tmp7;
var tmp defined by:
  tmp: int = id tmp16;
var digit defined by:
  digit: int = id tmp9;
var tmp14 defined by:
  tmp14: bool = const false;
var tmp16 defined by:
  tmp16: int = div tmp tmp15;
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;
var tmp15 defined by:
  tmp15: int = const 10;
var tmp2 defined by:
  tmp2: int = const -1;

block4 ():

block5 (label12):
var prev defined by:
  prev: int = id digit;
var tmp15 defined by:
  tmp15: int = const 10;
var tmp10 defined by:
  tmp10: bool = lt digit prev;
var tmp1 defined by:
  tmp1: int = const 1;
var tmp16 defined by:
  tmp16: int = div tmp tmp15;
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;
var tmp defined by:
  tmp: int = id tmp16;
var tmp2 defined by:
  tmp2: int = const -1;
var digit defined by:
  digit: int = id tmp9;
var tmp8 defined by:
  tmp8: bool = gt tmp tmp7;
var tmp9 defined by:
  tmp9: int = call @last_digit tmp;
var tmp7 defined by:
  tmp7: int = const 0;

block6 (label13):
var tmp defined by:
  tmp: int = id tmp16;
var digit defined by:
  digit: int = id tmp9;
var tmp2 defined by:
  tmp2: int = const -1;
var tmp16 defined by:
  tmp16: int = div tmp tmp15;
var tmp9 defined by:
  tmp9: int = call @last_digit tmp;
var tmp7 defined by:
  tmp7: int = const 0;
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;
var tmp8 defined by:
  tmp8: bool = gt tmp tmp7;
var tmp15 defined by:
  tmp15: int = const 10;
var prev defined by:
  prev: int = id digit;
var tmp10 defined by:
  tmp10: bool = lt digit prev;
var tmp1 defined by:
  tmp1: int = const 1;

block7 (label6):
var tmp9 defined by:
  tmp9: int = call @last_digit tmp;
var tmp7 defined by:
  tmp7: int = const 0;
var prev defined by:
  prev: int = id digit;
var tmp2 defined by:
  tmp2: int = const -1;
var tmp17 defined by:
  tmp17: bool = const true;
var tmp8 defined by:
  tmp8: bool = gt tmp tmp7;
var tmp16 defined by:
  tmp16: int = div tmp tmp15;
var digit defined by:
  digit: int = id tmp9;
var tmp defined by:
  tmp: int = id tmp16;
var tmp10 defined by:
  tmp10: bool = lt digit prev;
var tmp15 defined by:
  tmp15: int = const 10;
var tmp3 defined by:
  tmp3: int = mul tmp1 tmp2;
var tmp1 defined by:
  tmp1: int = const 1;

INS last_digit
block0 (last_digit):

OUTS last_digit
block0 (last_digit):
var tmp22 defined by:
  tmp22: int = sub x tmp21;
var tmp20 defined by:
  tmp20: int = const 10;
var tmp18 defined by:
  tmp18: int = const 10;
var tmp19 defined by:
  tmp19: int = div x tmp18;
var tmp21 defined by:
  tmp21: int = mul tmp19 tmp20;

