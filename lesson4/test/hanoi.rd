INS hanoi
block0 (hanoi):

block1 (then):
var zero defined by:
  zero: int = const 0;
var pos defined by:
  pos: bool = gt disks zero;

block2 (else):
var one defined by:
  one: int = const 1;
var pos defined by:
  pos: bool = gt disks zero;
var zero defined by:
  zero: int = const 0;
var above defined by:
  above: int = sub disks one;

OUTS hanoi
block0 (hanoi):
var pos defined by:
  pos: bool = gt disks zero;
var zero defined by:
  zero: int = const 0;

block1 (then):
var pos defined by:
  pos: bool = gt disks zero;
var one defined by:
  one: int = const 1;
var zero defined by:
  zero: int = const 0;
var above defined by:
  above: int = sub disks one;

block2 (else):
var above defined by:
  above: int = sub disks one;
var one defined by:
  one: int = const 1;
var pos defined by:
  pos: bool = gt disks zero;
var zero defined by:
  zero: int = const 0;

INS main
block0 (main):

OUTS main
block0 (main):
var src defined by:
  src: int = const 0;
var dst defined by:
  dst: int = const 2;
var spare defined by:
  spare: int = const 1;

