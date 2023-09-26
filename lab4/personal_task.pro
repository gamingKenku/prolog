three_digits_unique(X, Y) :-
    X =< Y,
    number_chars(X, [A, B, C]),
    (
        A \= B, A \= C, B \= C ->
            write(X), nl;
            write('')
    ),
    Next_X is X + 1,
    three_digits_unique(Next_X, Y).
