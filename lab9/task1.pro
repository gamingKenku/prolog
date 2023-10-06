:- dynamic player/7.

add_record(Id, Name, Team, Number, Heigth, Weight, Seasons) :-
    \+ player(Id, _, _, _, _, _, _),
    assertz(player(Id, Name, Team, Number, Heigth, Weight, Seasons)).

delete_record(Id) :-
    retract(player(Id, _, _, _, _, _, _)).

show_info(Id) :-
    player(Id, Name, Team, Number, Heigth, Weight, Seasons),
    format('Player info:~n Id: ~w~n Name: ~w~n Team: ~w~n Number: ~w~n Height: ~w~n Weight: ~w~n Seasons: ~w~n', [Id, Name, Team, Number, Heigth, Weight, Seasons]), !.

menu(1) :-
    write('Enter player id:'), nl, read(Id),
    write('Enter player name:'), nl, read(Name),
    write('Enter player team:'), nl, read(Team),
    write('Enter player number:'), nl, read(Number),
    write('Enter player height:'), nl, read(Height),
    write('Enter player weight:'), nl, read(Weight),
    write('Enter player played seasons:'), nl, read(Seasons),
    add_record(Id, Name, Team, Number, Heigth, Weight, Seasons).


main :-
    write('Enter command:'), nl,
    write(' 1 - Add player'), nl,
    write(' 2 - Delete player'), nl,
    write(' 3 - Show info about player'), nl,
    read(Command),
    menu(Command).



