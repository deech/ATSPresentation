#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
#include "prelude/DATS/pointer.dats"

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
%}

extern fun malloc{a:t@ype}(s:sizeof_t a):
                 [l:addr | l > null](a? @ l | ptr l) = "mac#malloc"
extern fun free{a:t@ype}{l : addr| l > null}(a @ l | ptr l):
                 void = "mac#free"
extern fun swap
  {a:t@ype}
  {l1: addr | l1 > null}
  {l2: addr | l2 > null}
  (a @ l1 , a @ l2 | i : ptr l1, j : ptr l2, s: sizeof_t a):
    (a @ l1, a @ l2 | void) = "mac#swap"

implement main0 () = let
  val (pfi | i) = malloc (sizeof<int>)
  val (pfj | j) = malloc (sizeof<int>)
  val _ = ptr_set(pfi | i, 1)
  val _ = ptr_set(pfj | j, 2)
  val (pfi1,pfj1| ()) = swap(pfi, pfj | i, j, sizeof<int>)
in
  print(ptr_get<int>(pfi1 | i));
  print(ptr_get<int>(pfj1 | j));
  free(pfi1 | i);
  free(pfj1 | j);
end