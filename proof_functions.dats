#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
#include "prelude/DATS/pointer.dats"

%{^
  void my_ptr_set(int *i, int j) {
    *i = j;
  }
  int my_ptr_get(int *i) {
    return *i;
  }
%}

extern fun malloc{a:t@ype}(s:sizeof_t a):
                 [l:addr | l > null](a? @ l | ptr l) = "mac#malloc"
extern fun free{a:t@ype}{l : addr| l > null}(a @ l | ptr l):
                 void = "mac#free"

extern fun my_ptr_set
 {l:addr | l > null}
 (pf: int? @ l | p: ptr l, x: int)
   :(int @ l | void) =
 "mac#my_ptr_set"

extern fun my_ptr_get
 {l:addr | l > null}
 (pf : int @ l | p : ptr l)
   :(int @ l | int) =
 "mac#my_ptr_get"

implement main0 () = let
  val (pf | i) = malloc(sizeof<int>)
  val (pf1 | _) = my_ptr_set(pf | i, 10)
  val (pf2 | ii) = my_ptr_get(pf1 | i)
in
  print(ii);
  free(pf2 | i);
end
