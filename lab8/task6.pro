read_from_stream(Stream, ResList) :-
    read_line_to_string(Stream, Element),
    read_from_stream(Element, Stream, ResList).

read_from_stream(end_of_file, _, []).
read_from_stream(Element, Stream, [Element|ResList]) :-
    read_line_to_string(Stream, NewElement),
    read_from_stream(NewElement, Stream, ResList).

main :-
    open('test.txt', read, Stream),
    read_from_stream(Stream, ResList),
    close(Stream),
    maplist(atom_string, ResList, AtomResList),
    write(AtomResList).