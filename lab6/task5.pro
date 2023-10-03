divide_list(List, ResList1, ResList2) :-
    divide_list(List, ResList1, ResList2, 0).

divide_list([], _, _, _) :- !.
divide_list([Head|Tail], [Head|ResList1], ResList2, Counter) :-
    NextCounter is Counter + 1,
    Counter mod 2 =:= 0,
    divide_list(Tail, ResList1, ResList2, NextCounter).
divide_list([Head|Tail], ResList1, [Head|ResList2], Counter) :-
    NextCounter is Counter + 1,
    Counter mod 2 =\= 0,
    divide_list(Tail, ResList1, ResList2, NextCounter).

main :-
    List = [23,1,34,2,45,5,4],
    divide_list(List, ResList1, ResList2),
    maplist(atom_string, ResList1, AtomStrings1),
    maplist(atom_string, ResList2, AtomStrings2),
    atomic_list_concat(AtomStrings1, ', ', String1),
    atomic_list_concat(AtomStrings2, ', ', String2),
    write(String1), write('|'), write(String2), nl.

    