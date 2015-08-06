#include "share/atspre_staload.hats"
#include "prelude/DATS/pointer.dats"
#include "share/atspre_staload.hats"

// fun print_list (l: List_vt (int)): void =
//   case+ l of
//   | list_vt_cons (x, xs) => (
//     fprint(stdout_ref, x);
//     print_list(xs)
//   )
//   | list_vt_nil () => ()

fun print_list (l: List_vt (int)): void =
  case+ l of
    | @list_vt_cons (x, xs) => (
          fprint(stdout_ref, x);
          print_list(xs);
          fold@ l
        )
    | list_vt_nil () => ()

implement main0() = {
  val a = list_make_intrange(0,10)
  val () = print_list (a)
  val () = list_vt_free (a)
}