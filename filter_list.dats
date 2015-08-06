#include "share/atspre_staload.hats"
#include "prelude/DATS/pointer.dats"
#include "share/atspre_staload.hats"

fun {a:t@ype}
    list_vt_filter
     {n: int}
     (l: !list_vt (a, n), f: a -> bool)
        :[k: int | k <= n] list_vt (a , k) = let
in
  case+ l of
  | @list_vt_nil () => (fold@ l; list_vt_nil)
  | @list_vt_cons (x, xs) when f (x) =>
       let
         val rest = list_vt_filter(xs,f)
         prval () = lemma_list_vt_param (rest)
         val r = list_vt_cons (x, rest)
       in
         fold@ l;
         r
       end
  | @list_vt_cons (x, xs) =>
       let
         val r = list_vt_filter (xs, f)
       in
         fold@ l;
         r
       end
end

fun print_list (l: !List_vt (int)): void =
  case+ l of
    | @list_vt_cons (x, xs) => (
          fprint(stdout_ref, x);
          print_list(xs);
          fold@ l
        )
    | list_vt_nil () => ()

implement main0() = {
  val a = list_make_intrange(0,10)
  val b = list_vt_filter(a, lam(x) => x mod 2 = 0)
  val () = print_list(b)
  val () = list_vt_free(a)
  val () = list_vt_free(b)
}