write_list([]) :- !.
write_list([Head|Tail]) :-
    write(Head), write(' '),
    write_list(Tail).

len([], 0) :- !.
len([_|Tail], Length) :-
    len(Tail, TailLength),
    Length is TailLength + 1.

n_element([X|_],1,X).
n_element([_|L],N,Y) :-
    N > 1,
    N1 is N-1,
    n_element(L,N1,Y).
n_element(_, _, _) :-
    write('error').

main :-
    List = [1, 2, 6, 2, 19, 52, 39],
    % write_list(List), nl,
    % len(List, Length),
    % write(Length), nl.
    n_element(List, 8, Element),
    write(Element).