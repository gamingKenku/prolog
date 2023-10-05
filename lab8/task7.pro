read_elements(Stream) :-
    write('Enter elements.'), nl,
    read_line_to_string(user_input, Element),
    read_elements(Element, Stream).

read_elements("", _).
read_elements(Element, Stream) :-
    writeln_to_stream(Stream, Element),
    read_line_to_string(user_input, NewElement),
    read_elements(NewElement, Stream).

writeln_to_stream(Stream, String) :-
    write(Stream, String), nl(Stream).

main :-
    write('Enter file name.'), nl,
    read_line_to_string(user_input, FileName),
    open(FileName, write, Stream),
    read_elements(Stream),
    close(Stream).
