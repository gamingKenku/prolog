:- dynamic player/7.

add_record(Id, Name, Team, Number, Heigth, Weight, Seasons) :-
    \+ player(Id, _, _, _, _, _, _),
    assertz(player(Id, Name, Team, Number, Heigth, Weight, Seasons)).

delete_record(Id) :-
    retract(player(Id, _, _, _, _, _, _)).

show_info(Id) :-
    player(Id, Name, Team, Number, Heigth, Weight, Seasons),
    format('Player info:~n Id: ~w~n Name: ~w~n Team: ~w~n Number: ~w~n Height: ~w~n Weight: ~w~n Seasons: ~w~n', [Id, Name, Team, Number, Heigth, Weight, Seasons]), !.

show_all_info :-
    findall(player(Id, Name, Team, Number, Height, Weight, Seasons), player(Id, Name, Team, Number, Height, Weight, Seasons), Players),
    display_players(Players),
    write('--------------------------------------'), nl.

display_players([]).
display_players([player(Id, Name, Team, Number, Height, Weight, Seasons)|Rest]) :-
    write('--------------------------------------'), nl,
    format('Player info:~n Id: ~w~n Name: ~w~n Team: ~w~n Number: ~w~n Height: ~w~n Weight: ~w~n Seasons: ~w~n', [Id, Name, Team, Number, Height, Weight, Seasons]),
    display_players(Rest).


menu(0) :-
    write('Enter command:'), nl,
    write(' 1 - Add player'), nl,
    write(' 2 - Delete player'), nl,
    write(' 3 - Show info about player'), nl,
    write(' 4 - Show info about all players'), nl,
    write(' 5 - Exit'), nl,
    read(Command),
    menu(Command).
menu(1) :-
    write('Enter player id:'), nl, read(Id),
    write('Enter player name:'), nl, read(AtomName), atom_string(AtomName, Name),
    write('Enter player team:'), nl, read(AtomTeam), atom_string(AtomTeam, Team),
    write('Enter player number:'), nl, read(Number),
    write('Enter player height:'), nl, read(Height),
    write('Enter player weight:'), nl, read(Weight),
    write('Enter player played seasons:'), nl, read(Seasons),
    add_record(Id, Name, Team, Number, Height, Weight, Seasons),
    menu(0).
menu(2) :-
    write('Enter player id:'), nl, read(Id),
    delete_record(Id),
    menu(0).
menu(3) :-
    write('Enter player id:'), nl, read(Id),
    show_info(Id),
    menu(0).
menu(4) :-
    show_all_info,
    menu(0).
menu(5) :-
    write('Ending program execution...'), nl, !.
menu(_) :-
    write('Wrong command or parameter.'), nl,
    menu(0).



main :-
    menu(0).
    