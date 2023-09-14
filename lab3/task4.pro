parent('Maria', 'Fyodor').
parent('Ivan', 'Fyodor').
parent('Maria', 'Stepan').
parent('Ivan', 'Stepan').
parent('Fyodor', 'Olga').
parent('Fyodor', 'Tatiana').

has_children(X) :-
    parent(X, _).