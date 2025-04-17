#include <stdio.h>

int main() {
  int j = 0;
  for (int i = 0; i < 50000000; i ++) {
    j = 35*i;
  }
  return j;
}