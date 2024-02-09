  $ dune build
  $ cat spec_t.ml
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  [@@@alert "-codegen_only"]
  [@@@alert "-something_else"]
  
  type person = { name: string }

  $ cat spec_t.mli
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  [@@@alert "-codegen_only"]
  [@@@alert "-something_else"]
  
  type person = { name: string }

  $ cat spec_j.ml
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  [@@@alert "-codegen_only"]
  [@@@alert "-something_else"]
  
  type person = Spec_t.person = { name: string }
  
  let write_person : _ -> person -> _ = (
    fun ob (x : person) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x.name;
      Buffer.add_char ob '}';
  )
  let string_of_person ?(len = 1024) x =
    let ob = Buffer.create len in
    write_person ob x;
    Buffer.contents ob
  let read_person = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_name = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 4 && String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 4 && String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_name := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
            }
           : person)
        )
  )
  let person_of_string s =
    read_person (Yojson.Safe.init_lexer ()) (Lexing.from_string s)

  $ cat spec_j.mli
  (* Auto-generated from "spec.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  [@@@alert "-codegen_only"]
  [@@@alert "-something_else"]
  
  type person = Spec_t.person = { name: string }
  
  val write_person :
    Buffer.t -> person -> unit
    (** Output a JSON value of type {!type:person}. *)
  
  val string_of_person :
    ?len:int -> person -> string
    (** Serialize a value of type {!type:person}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_person :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> person
    (** Input JSON data of type {!type:person}. *)
  
  val person_of_string :
    string -> person
    (** Deserialize JSON data of type {!type:person}. *)
  
