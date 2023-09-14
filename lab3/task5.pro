parent('Maria', 'Fyodor').
parent('Ivan', 'Fyodor').
parent('Maria', 'Stepan').
parent('Ivan', 'Stepan').
parent('Fyodor', 'Olga').
parent('Fyodor', 'Tatiana').

female('Maria').
female('Olga').
female('Tatiana').
male('Ivan').
male('Fyodor').
male('Stepan').

are_brothers(X, Y) :-
    male(X),
    male(Y),
    X \= Y,
    parent(Z, X),
    parent(Z, Y).

uncle(X, Y) :-
    parent(Z, Y),
    are_brothers(X, Z).