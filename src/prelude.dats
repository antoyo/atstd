#define ATS_DYNLOADFLAG 0

#define ATS_PACKNAME "atstd"

staload "./prelude.sats"

exception Test

implement {a}{b}{c} result_map(result, func) =
    case+ result of
    | Ok(value) => Ok(func(value))
    | Err(error) => Err(error)

(*implement {a}{b}{c} >>=(result, func) =
    result_map(result, func)*)

implement {a}{b}{c} !!(result1, result2) =
    case+ result1 of
    | Ok(_) => result2
    | Err(error) => Err(error)

implement result_map_int(result, func) =
    case+ result of
    | Ok(value) => Ok(func(value))
    | Err(error) => Err(error)

implement {a}{b}{c} >>=(result, func) =
    result_map(result, func)

implement {a}{b}{c} >>(result1, result2) =
    case+ result1 of
    | Ok(_) => result2
    | Err(error) => Err(error)

implement {a}{b}{c} result_and_then(result, func) =
    case+ result of
    | Ok(value) => func(value)
    | Err(error) => Err(error)

implement {a}{b} result_is_err(result) =
    case+ result of
    | Ok(_) => false
    | Err(_) => true
