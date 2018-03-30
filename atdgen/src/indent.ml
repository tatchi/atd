
(*
  Atd.Indent extended with annnotations allowing some postprocessing.
*)

type t =
  [ `Line of string
  | `Block of t list
  | `Inline of t list
  | `Annot of (string * t)
  ]

let rec strip = function
  | `Line _ as x -> x
  | `Block l -> `Block (List.map strip l)
  | `Inline l -> `Inline (List.map strip l)
  | `Annot (_, x) -> strip x

let rec concat t = function
  | [] -> []
  | [x] -> [x]
  | x::xs -> x::t::(concat t xs)
