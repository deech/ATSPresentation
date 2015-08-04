#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
staload UN = "prelude/SATS/unsafe.sats"

extern fun malloc (s: size_t): ptr = "mac#malloc"
extern fun free (p: ptr):void = "mac#free"
extern fun memcpy(into: ptr, from: ptr, s: size_t): void = "mac#memcpy"

fun swap(i: ptr, j: ptr, s: size_t): void = let
   val tmp = malloc(s)
in
   memcpy(tmp,j,s);
   memcpy(j,i,s);
   memcpy(i,tmp,s);
   free(tmp);
end

implement main0 () = let
  val i = malloc(sizeof<double>)
  val j = malloc(sizeof<int>)
in
  $UN.ptr0_set<int>(i, 1);
  $UN.ptr0_set<int>(j, 2);
  swap(i,j,sizeof<int>);
  print($UN.ptr0_get<int> (i));
  print("\n");
  print($UN.ptr0_get<int> (j));
  print("\n");
  free(i);
  // free(j);
end