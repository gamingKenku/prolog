list_concat([], List, List).
list_concat([Head1|Tail1], List2, [Head1|Result]) :-
    list_concat(Tail1, List2, Result).

main :-
    List1 = [1, 2],
    List2 = [3, 4],
    list_concat(List1, List2, Result),
    write(Result).
