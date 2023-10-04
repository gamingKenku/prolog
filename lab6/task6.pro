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


divide_films_list([], [], _, _, _, _, _).
divide_films_list([HeadNameList|TailNameList], [HeadLenList|TailLenList], [HeadNameList|ResNameList1], [HeadLenList|ResLenList1], ResNameList2, ResLenList2, TargetLength) :-
    HeadLenList =< TargetLength,
    divide_films_list(TailNameList, TailLenList, ResNameList1, ResLenList1, ResNameList2, ResLenList2, TargetLength).
divide_films_list([HeadNameList|TailNameList], [HeadLenList|TailLenList], ResNameList1, ResLenList1, [HeadNameList|ResNameList2], [HeadLenList|ResLenList2], TargetLength) :-
    HeadLenList > TargetLength,
    divide_films_list(TailNameList, TailLenList, ResNameList1, ResLenList1, ResNameList2, ResLenList2, TargetLength).

names_list(List) :-
    findall(Name, film(Name, _, _, _, _), List).

lengths_list(List) :-
    findall(Length, film(_, _, Length, _, _), List).

first_subtask :-
    names_list(NameList),
    lengths_list(LengthList),
    write('Enter target length.'), nl,
    read(TargetLength),
    divide_films_list(NameList, LengthList, ResNameList1, ResLengthList1, ResNameList2, ResLengthList2, TargetLength),
    write('First lists:'), nl,
    write(ResNameList1), nl, write(ResLengthList1), nl, 
    write('Second lists:'), nl,
    write(ResNameList2), nl, write(ResLengthList2), nl.

% ------------------------------------------------------------------------------

film_date(Day, Month, Year) :-
    film(_, _, _, _, DateString),
    atomic_list_concat([Day, Month, Year], '.', DateString).

years_list(List) :-
    findall(Year, film_date(_, _, Year), List).

max(X,Y,M) :-
    (
        X > Y -> M is X;
        M is Y
    ).

max_list([X], X). 
max_list([H|T], M) :-
    max_list(T, M_T), 
    max(H, M_T, M). 

second_subtask :-
    years_list(YearsList),
    maplist(atom_number, YearsList, NumberYearsList),
    max_list(NumberYearsList, MaxYear),
    write(MaxYear).
    
% ------------------------------------------------------------------------------

countries_list(List) :-
    findall(Country, film(_, Country, _, _, _), List).

member(X,[X|_]). 
member(X,[_|T]) :-
    member(X,T).

remove_duplicates([], _).
remove_duplicates([Head|Tail], Result) :-
    member(Head, Result),
    remove_duplicates(Tail, Result).
remove_duplicates([Head|Tail], [Head|Result]) :-
    \+ member(Head, Tail),
    remove_duplicates(Tail, Result).

third_subtask :- 
    countries_list(CountryList),
    remove_duplicates(CountryList, ResList),
    maplist(atom_string, ResList, AtomResList),
    write(AtomResList).
