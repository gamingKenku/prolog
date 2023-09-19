biggest_common_divider(X, Y) :-
    (
        X < Y -> 
            Rem is Y mod X,
            (
                Rem =:= 0 ->
                    write('biggest common divider = '), write(X), nl;
                    biggest_common_divider(Rem, Y)
            );
        Y =< X ->
            Rem is X mod Y,
            (
                Rem =:= 0 ->
                    write('biggest common divider = '), write(Y), nl;
                    biggest_common_divider(X, Rem)
            )
    ).