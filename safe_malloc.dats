#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
#include "prelude/DATS/pointer.dats"

extern fun malloc{a:t@ype}(s:sizeof_t a):
                 [l:addr | l > null](a? @ l | ptr l) = "mac#malloc"
extern fun free{a:t@ype}{l : addr| l > null}(a @ l | ptr l):
                 void = "mac#free"
implement main0 () = let
  val (pf | a) = malloc (sizeof<int>)
  val _ = ptr_set(pf | a, 10)
  val x = ptr_get(pf | a)
  val y = x + 1
in
  free(pf | a);
end