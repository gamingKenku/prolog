even :-
    write("Enter number: "),
    read(Number),

    (Number mod 2 =:= 0 ->
        write("even"), nl
    ;
        write("odd"), nl
    ).

even_random :-
    random(1, 100, Number),

    write(Number), nl,

    (Number mod 2 =:= 0 ->
        write("even"), nl
    ;
        write("odd"), nl
    ).