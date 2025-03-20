#include <stdio.h>

int main() {
  int j;
  for (int i = 0; i < 5000000; i ++) {
    int j = 35*i;
    // printf("%d\n", j);
  }
  return j;
}