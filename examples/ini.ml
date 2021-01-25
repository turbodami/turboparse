type key = string
type value = string
type pair = key * value
type section = 
    {
        name: string;
        pairs: pair list
    }

let show_section (sec: section) =
    Printf.printf "{ name = %s; pairs = }"

let show_sections (sections: section list): string = 
    sections
    |> List.map show_sections
    |> String.concat ","
    |> Printf.printf "[%s]"

let ini: section list Turboparse.parser = 
    Turboparse.failwith
        { desc = "Not implemented yet";
          pos = 0;  
        }

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
    | Ok (_, sections) -> sections
                            |> show_section
                            |> print_endline
    | Error error -> Printf.printf 
                        "Error happened at %d: %s" 
                        error.pos 
                        error.desc