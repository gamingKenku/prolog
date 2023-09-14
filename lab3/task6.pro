film('Redemption', 'Britain', 130, 'Drama', '19.02.2008').
film('Canned Food', 'Russia', 115, 'Thriller', '22.02.2007').
film('Paragraph 78', 'Russia', 90, 'Action', '22.02.2007').
film('Spy Kids', 'USA', 90, 'Comedy', '30.03.2001').
film('Hidden Threat', 'USA', 90, 'Thriller', '2.11.2001').
film('Daughter Of My Boss', 'USA', 90, 'Comedy', '22.08.2003').

find_drama(X) :-
    film(X, _, _, 'Drama', _).

find_american_film(X) :-
    film(X, 'USA', _, _, _).

find_recent_film(X) :-
    film(X, _, _, _, DateString),
    parse_date(DateString, Year),
    Year > 2005.

parse_date(DateString, Year) :-
    atomic_list_concat([_, _, YearString], '.', DateString),
    atom_number(YearString, Year).
