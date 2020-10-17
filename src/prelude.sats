#define ATS_PACKNAME "atstd"

datatype Result(value:t@ype, error: t@ype) =
    | Ok of value
    | Err of error

fun {a: t@ype}{b: t@ype}{c: t@ype} result_map(result: Result(a, b), func: a -<cloref1> c): Result(c, b)

fun result_map_int(result: Result(int, int), func: int -<cloref1> int): Result(int, int)

overload .map with result_map
overload .map_int with result_map_int

(*infixr >>=
(*macdef >>= (a, b) = result_map(,(a), ,(b))*)
fun {a: t@ype}{b: t@ype}{c: t@ype} >>=(result: Result(a, b), func: a -<cloref1> c): Result(c, b)*)

infixr !!
fun {a: t@ype}{b: t@ype} {c: t@ype} !!(result: Result(a, b), Result(c, b)): Result(c, b)


fun {a: t@ype}{b: t@ype} {c: t@ype} result_and_then(result: Result(a, b), func: a -<cloref1> Result(c, b)): Result(c, b)

infixr >>=
fun {a: t@ype}{b: t@ype} {c: t@ype} >>=(result: Result(a, b), func: a -<cloref1> c): Result(c, b)

infixr >>
fun {a: t@ype}{b: t@ype} {c: t@ype} >>(result: Result(a, b), Result(c, b)): Result(c, b)

fun {a: t@ype}{b: t@ype} result_is_err(result: Result(a, b)): bool
