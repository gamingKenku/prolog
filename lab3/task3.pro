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

are_sisters(X, Y) :-
    female(X),
    female(Y),
    parent(Z, X),
    parent(Z, Y).