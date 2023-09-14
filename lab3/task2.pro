parent('Maria', 'Fyodor').
parent('Ivan', 'Fyodor').
parent('Maria', 'Stepan').
parent('Ivan', 'Stepan').
parent('Fyodor', 'Olga').
parent('Fyodor', 'Tatiana').

fyodor_paren_of_olga :-
    parent('Fyodor', 'Olga').

parent_of_tatiana(X) :-
    parent(X, 'Tatiana').

children_of_ivan(X) :- 
    parent('Ivan', X).

olgas_parent_of_parent(Y) :-
    parent(X, 'Olga'),
    parent(Y, X).

ivans_grandchilden(Y) :-
    parent('Ivan', X),
    parent(X, Y).

common_parent_of_fyodor_stepan :-
    parent(X, 'Fyodor'),
    parent(X, 'Stepan').

parents(X, Y) :-
    (
        parent(X, Y) ->
            write(X), write(' is a parent of '), write(Y), nl;
        parent(Y, X) ->
            write(Y), write(' is a parent of '), write(X), nl;
            write('Are not parents to each other.')
    ).

    