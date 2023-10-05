list_concat([], List, List) :-
    format('Starting concatenation~n').
list_concat([Head1|Tail1], List2, [Head1|Result]) :-
    list_concat(Tail1, List2, Result),
    format('Setting ~w to ~w~n', [Head1, Result]).

main :-
    List1 = [1, 2],
    List2 = [3, 4],
    list_concat(List1, List2, Result),
    format('The result: ~w~n', [Result]).
