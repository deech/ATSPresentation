/**
   gcc swap.c -o swap
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void swap(void *i, void *j, size_t size) {
  void* tmp = malloc(size);
  memcpy(tmp, j, size);
  memcpy(j, i, size);
  memcpy(i, tmp, size);
  free(tmp);
}

void main() {
  int a = 1, b = 2;
  swap(&a, &b, sizeof(int));
  printf("After . a: %d, b: %d\n", a, b);
}
