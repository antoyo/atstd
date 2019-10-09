(* Compile with:
 * patscc -DATS_MEMALLOC_LIBC -o result ../src/prelude.dats result.dats
 *)

#include "share/atspre_staload.hats"
#include "share/atspre_staload_libats_ML.hats"

staload "../src/prelude.sats"
staload "../src/prelude.dats"

fun tuple(): Result((), ()) =
    (*result_map(Ok(()), lam(value) => value)*)
    let val tuple = ()
    in
    result_map<()><()><()>(Ok(()), lam(value) => @())
    end
    (*Err(())*)
    (*Err($tup(5, 2))*)

fun test(): Result($tup(), int) =
    (*$tup()*)
    let val result: Result(int, int) = Ok(5)
    in
        result_map(result, lam(value) => $tup())
        (*result >>= (lam(value) => $tup())*)
        (*result !! Ok($tup())*)
        (*result >>= (lam(result) => Ok($tup()))*)
    end

implement main0() = {
    val result: Result(int, int) = Ok(5);
    (*val new_result = result_map<int><int><int>(result, lam(value) => value + 1);*)
    val new_result: Result(int, int) = result_map(result, lam(value: int) => value + 1);
    (*val new_result: Result(int, int) = result.map(lam(value: int) => value + 1);*)
    (*val new_result: Result(int, int) = result.map(lam(value: int) => value + 1);*)
    (*val new_result = result.map_int(lam(value) => value + 1);*)
    val () =
        case+ new_result of
        | Ok(value) => println!("Val:", value)
        | Err(error) => println!("Error")
}
