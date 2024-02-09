Output ml only
  $ atdgen -t -output ml -o - spec.atd
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type person = { name: string }

Output mli only
  $ atdgen -t -output mli -o - spec.atd
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type person = { name: string }

Output both ml and li
  $ atdgen -t -output both -o - spec.atd
  struct
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type person = { name: string }
  
  end :
  sig
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type person = { name: string }
  
  end

Output default (both)
  $ atdgen -t -o - spec.atd
  struct
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type person = { name: string }
  
  end :
  sig
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type person = { name: string }
  
  end

  $ dune build
Make sure .mli file does not exist
  $ test ! -f spec_t.mli
  $ cat spec_t.ml
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type person = { name: string }

  $ cat spec_with_prelude_t.ml
  [@@@alert "-codegen_only"]
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type person = { name: string }

  $ cat spec_with_prelude_t.mli
  [@@@alert "-codegen_only"]
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type person = { name: string }
