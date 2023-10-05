find_one(X, List) :-
    format('Starting searching for ~w~n', [X]),
    find_one(X, List, 1).

find_one(X, [], _) :-
    format('Reached end of the list, ~w not found~n', [X]).
find_one(X, [X|_], I) :-
    format('Checking ~w on ~w~n', [X, I]),
    format('Found ~w at ~w~n', [X, I]), !.
find_one(X, [_|L], I) :-
    format('Checking ~w on ~w~n', [X, I]),
    NewI is I + 1,
    find_one(X, L, NewI).


main :- 
    List = [4, 2, 6, 2, 4, 1, 0, 4, 20],
    write('Target - 0'), nl, find_one(0, List), nl.

