type key = string
type value = string
type pair = key * value
type section = pair list

let print_sections (sections: section list) = 
    failwith "TODO"

let ini: section list Turboparse.parser = failwith "TODO"

let read_whole_file (file_path: string): string = 
    let ch = open_in file_path in
    let n = in_channel_length ch in
    let s = really_input_string ch n
    close_in ch;
    s

let () = 
    let result = "./test.ini"
                 |> read_whole_file
                 |> Turboparse.make_input
                 |> ini.run
    in
    match result with
    | Ok (_, sections) -> print_sections sections
    | Error error -> Printf.printf "Error happened at %d: %s" error.pos error.desc