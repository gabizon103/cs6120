INS main
block0 (main):

block1 (begin):
var ten defined by:
  ten: int = const 10;
var processed defined by:
  processed: bool = call @is_single_digit result;
var digit defined by:
  digit: int = call @peel_last_digit input;
var result defined by:
  result: int = const 0;
var r0 defined by:
  r0: int = call @peel_last_digit result;
var input defined by:
  input: int = div input ten;
var done defined by:
  done: bool = eq input zero;
var zero defined by:
  zero: int = const 0;

block2 (check_result):
var input defined by:
  input: int = div input ten;
var done defined by:
  done: bool = eq input zero;
var result defined by:
  result: int = add result digit;
var r0 defined by:
  r0: int = call @peel_last_digit result;
var zero defined by:
  zero: int = const 0;
var processed defined by:
  processed: bool = call @is_single_digit result;
var ten defined by:
  ten: int = const 10;
var digit defined by:
  digit: int = call @peel_last_digit input;

block3 (process_result):
var digit defined by:
  digit: int = call @peel_last_digit input;
var input defined by:
  input: int = div input ten;
var done defined by:
  done: bool = eq input zero;
var result defined by:
  result: int = add result digit;
var zero defined by:
  zero: int = const 0;
var processed defined by:
  processed: bool = call @is_single_digit result;
var ten defined by:
  ten: int = const 10;
var r0 defined by:
  r0: int = call @peel_last_digit result;

block4 (check_done):
var processed defined by:
  processed: bool = call @is_single_digit result;
var done defined by:
  done: bool = eq input zero;
var result defined by:
  result: int = add result digit;
var zero defined by:
  zero: int = const 0;
var r0 defined by:
  r0: int = call @peel_last_digit result;
var ten defined by:
  ten: int = const 10;
var digit defined by:
  digit: int = call @peel_last_digit input;
var input defined by:
  input: int = div input ten;

block5 (done):
var result defined by:
  result: int = add result digit;
var zero defined by:
  zero: int = const 0;
var r0 defined by:
  r0: int = call @peel_last_digit result;
var processed defined by:
  processed: bool = call @is_single_digit result;
var done defined by:
  done: bool = eq input zero;
var input defined by:
  input: int = div input ten;
var ten defined by:
  ten: int = const 10;
var digit defined by:
  digit: int = call @peel_last_digit input;

OUTS main
block0 (main):
var ten defined by:
  ten: int = const 10;
var result defined by:
  result: int = const 0;
var zero defined by:
  zero: int = const 0;

block1 (begin):
var ten defined by:
  ten: int = const 10;
var done defined by:
  done: bool = eq input zero;
var digit defined by:
  digit: int = call @peel_last_digit input;
var zero defined by:
  zero: int = const 0;
var processed defined by:
  processed: bool = call @is_single_digit result;
var r0 defined by:
  r0: int = call @peel_last_digit result;
var result defined by:
  result: int = add result digit;
var input defined by:
  input: int = div input ten;

block2 (check_result):
var input defined by:
  input: int = div input ten;
var done defined by:
  done: bool = eq input zero;
var result defined by:
  result: int = add result digit;
var r0 defined by:
  r0: int = call @peel_last_digit result;
var zero defined by:
  zero: int = const 0;
var processed defined by:
  processed: bool = call @is_single_digit result;
var ten defined by:
  ten: int = const 10;
var digit defined by:
  digit: int = call @peel_last_digit input;

block3 (process_result):
var processed defined by:
  processed: bool = call @is_single_digit result;
var ten defined by:
  ten: int = const 10;
var digit defined by:
  digit: int = call @peel_last_digit input;
var zero defined by:
  zero: int = const 0;
var r0 defined by:
  r0: int = call @peel_last_digit result;
var done defined by:
  done: bool = eq input zero;
var input defined by:
  input: int = div input ten;
var result defined by:
  result: int = add result r0;

block4 (check_done):
var processed defined by:
  processed: bool = call @is_single_digit result;
var done defined by:
  done: bool = eq input zero;
var result defined by:
  result: int = add result digit;
var zero defined by:
  zero: int = const 0;
var r0 defined by:
  r0: int = call @peel_last_digit result;
var ten defined by:
  ten: int = const 10;
var digit defined by:
  digit: int = call @peel_last_digit input;
var input defined by:
  input: int = div input ten;

block5 (done):
var result defined by:
  result: int = add result digit;
var zero defined by:
  zero: int = const 0;
var r0 defined by:
  r0: int = call @peel_last_digit result;
var processed defined by:
  processed: bool = call @is_single_digit result;
var done defined by:
  done: bool = eq input zero;
var input defined by:
  input: int = div input ten;
var ten defined by:
  ten: int = const 10;
var digit defined by:
  digit: int = call @peel_last_digit input;

INS is_single_digit
block0 (is_single_digit):

OUTS is_single_digit
block0 (is_single_digit):
var ten defined by:
  ten: int = const 10;
var mul_by_ten defined by:
  mul_by_ten: int = mul divided ten;
var result defined by:
  result: bool = eq mul_by_ten zero;
var divided defined by:
  divided: int = div input ten;
var zero defined by:
  zero: int = const 0;

INS peel_last_digit
block0 (peel_last_digit):

OUTS peel_last_digit
block0 (peel_last_digit):
var div_by_ten defined by:
  div_by_ten: int = div input ten;
var ten defined by:
  ten: int = const 10;
var mul_by_ten defined by:
  mul_by_ten: int = mul div_by_ten ten;
var last_digit defined by:
  last_digit: int = sub input mul_by_ten;

