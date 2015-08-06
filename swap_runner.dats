#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

%{^
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

void swap_runner() {
  int a = 1, b = 2;
  swap(&a, &b, sizeof(int));
  printf("After . a: %d, b: %d\n", a, b);
}
%}

extern fun swap_runner():void = "mac#swap_runner"

implement main0 () = swap_runner()