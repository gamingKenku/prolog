find_one(X, List) :-
    find_one(X, List, 1).

find_one(_, [], _) :-
    write('no such element').

find_one(X, [X|_], I) :-
    write('index: '), write(I), !.

find_one(X, [_|L], I) :-
    NewI is I + 1,
    find_one(X, L, NewI).


main :- 
    List = [4, 2, 6, 2, 4, 1, 0, 4, 20],
    write('4 -'), find_one(4, List), nl,
    write('1 -'), find_one(1, List), nl,
    write('20 -'), find_one(20, List), nl,
    write('2 -'), find_one(2, List), nl,
    write('5 -'), find_one(5, List), nl,
    write('6 -'), find_one(6, List), nl,
    write('0 -'), find_one(0, List), nl.

