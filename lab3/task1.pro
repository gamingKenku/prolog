gift('Nick', 'Tom', 'Book').
gift('Mary', 'Tom', 'Pen').
gift('Rick', 'Mary', 'Toy').
gift('Bob', 'Pat', 'Toy').

?- gift('Rick', 'Mary', 'Toy').
?- gift('Nick', 'Tom', 'Toy').
?- gift('Mary', 'Tom', X).
?- gift(_, 'Tom', X).
?- gift(X, 'Pat', 'Toy').


