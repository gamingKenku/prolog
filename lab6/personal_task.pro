get_negatives([], []).
get_negatives([Head|Tail], [Head|ResList]) :-
    Head < 0,
    get_negatives(Tail, ResList).
get_negatives([_|Tail], ResList) :-
    get_negatives(Tail, ResList).

replace_positives(List, ResList) :-
    get_negatives(List, NegativesList),
    replace_positives(List, ResList, NegativesList).

replace_positives([], [], _).
replace_positives([Head|Tail], [HeadNegatives|ResList], [HeadNegatives|TailNegatives]) :-
    Head >= 0,
    replace_positives(Tail, ResList, TailNegatives).
replace_positives([Head|Tail], [Head|ResList], NegativesList) :-
    replace_positives(Tail, ResList, NegativesList).

task :-
    List = [12, -2, 15, -5, -7, 12125, 124124],
    replace_positives(List, ResList),
    write(ResList).