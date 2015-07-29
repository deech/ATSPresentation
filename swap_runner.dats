#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

%{^
#include <stdio.h>

void swap(int *i, int *j) {
  int t = *i;
  *i = *j;
  *j = t;
}

void swap_runner() {
  int a = 1, b = 2;
  swap(&a, &b);
  printf("After a: %d, b: %d\n", a, b);
}
%}

extern fun swap_runner():void = "ext#swap_runner"

implement main0 () = swap_runner()