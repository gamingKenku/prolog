read_elements(ResList) :-
    write('Enter element.'), nl,
    read_line_to_string(user_input, Element),
    read_elements(Element, ResList).

read_elements("", []).
read_elements(Element, [Element|ResList]) :-
    Element \= "",
    read_line_to_string(user_input, NewElement),
    read_elements(NewElement, ResList).


task :-
    read_elements(ResList),
    maplist(atom_string, ResList, AtomResList),
    write(AtomResList).