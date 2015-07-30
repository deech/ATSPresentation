#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

val greet = lam () => "hello world\n"
implement main0 () = print(greet())
