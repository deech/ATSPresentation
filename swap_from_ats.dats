#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
staload UN = "prelude/SATS/unsafe.sats"

%{^
void swap(int *i, int *j) {
  int t = *i;
  *i = *j;
  *j = t;
}
%}

extern fun malloc (s: size_t): ptr = "mac#malloc"
extern fun free (p: ptr):void = "mac#free"
extern fun swap(p1: ptr, p2: ptr): void = "mac#swap"

implement main0 () = let
  val i = malloc(sizeof<double>)
  val j = malloc(sizeof<int>)
in
  $UN.ptr0_set<int>(i, 1);
  $UN.ptr0_set<int>(j, 2);
  swap(i,j);
  print($UN.ptr0_get<int> (i));
  print("\n");
  print($UN.ptr0_get<int> (j));
  print("\n");
  free(i);
  // free(j);
end