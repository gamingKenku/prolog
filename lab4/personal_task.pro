unique_numbers(X, Y) :-
    X =< Y,
    number_chars(X, [A, B, C]),
    (
        A \= B, A \= C, B \= C ->
            write(X), nl;
            write('')
    ),
    Next_X is X + 1,
    unique_numbers(Next_X, Y).
