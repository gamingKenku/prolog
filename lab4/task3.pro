sum_series(1, 1).
sum_series(0, 0).

sum_series(N, Sum) :-
    N > 1,
    Next_n is N - 2,
    sum_series(Next_n, Partial_Sum),
    Sum is N + Partial_Sum.
