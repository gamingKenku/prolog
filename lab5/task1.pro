film('Redemption', 'Britain', 130, 'Drama', '19.02.2008').
film('Canned Food', 'Russia', 115, 'Thriller', '22.02.2007').
film('Paragraph 78', 'Russia', 90, 'Action', '22.02.2007').
film('Spy Kids', 'USA', 90, 'Comedy', '30.03.2001').
film('Hidden Threat', 'USA', 90, 'Thriller', '2.11.2001').
film('Daughter Of My Boss', 'USA', 90, 'Comedy', '22.08.2003').
film('The Shawshank Redemption', 'USA', 142, 'Drama', '23.09.1994').
film('The Godfather', 'USA', 175, 'Crime', '24.03.1972').
film('Pulp Fiction', 'USA', 154, 'Crime', '14.10.1994').
film('Inception', 'USA', 148, 'Sci-Fi', '16.07.2010').
film('The Dark Knight', 'USA', 152, 'Action', '18.07.2008').
film('Forrest Gump', 'USA', 142, 'Drama', '06.07.1994').
film('Avatar', 'USA', 162, 'Adventure', '18.12.2009').
film('Gladiator', 'USA', 155, 'Action', '05.05.2000').
film('The Matrix', 'USA', 136, 'Sci-Fi', '31.03.1999').
film('Jurassic Park', 'USA', 127, 'Adventure', '11.06.1993').

find_american_recent_film(X) :-
    film(X, 'USA', _, _, DateString),
    parse_date(DateString, Year),
    Year > 2005.

parse_date(DateString, Year) :-
    atomic_list_concat([_, _, YearString], '.', DateString),
    atom_number(YearString, Year).
