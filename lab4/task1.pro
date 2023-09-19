write_number(N) :-
    N > 0,
    write(N), nl,
    Next_Number is N - 1,
    write_number(Next_Number).