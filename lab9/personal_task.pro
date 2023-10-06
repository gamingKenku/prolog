:- dynamic metal/4.

add_record(Id, Name, Conductivity, Cost) :-
    \+ metal(Id, _, _, _),
    assertz(metal(Id, Name, Conductivity, Cost)).

delete_record(Id) :-
    retract(metal(Id, _, _, _)).

show_info(Id) :-
    metal(Id, Name, Conductivity, Cost),
    format('Metal info:~n Id: ~w~n Name: ~w~n Conductivity: ~w~n Cost: ~w~n', [Id, Name, Conductivity, Cost]), !.

find_max_conductivity :-
    findall(Conductivity, metal(_, _, Conductivity, _), ConductivityList),
    max_list(ConductivityList, MaxConductivity),
    findall(metal(Id, Name, MaxConductivity, Cost), metal(Id, Name, MaxConductivity, Cost), Metals),
    display_metals(Metals),
    write('--------------------------------------'), nl.

find_min_cost :-
    findall(Cost, metal(_, _, _, Cost), CostList),
    min_list(CostList, MinCost),
    findall(metal(Id, Name, Conductivity, MinCost), metal(Id, Name, Conductivity, MinCost), Metals),
    display_metals(Metals),
    write('--------------------------------------'), nl.

display_metals([]).
display_metals([metal(Id, Name, Conductivity, Cost)|Rest]) :-
    write('--------------------------------------'), nl,
    format('Metal info:~n Id: ~w~n Name: ~w~n Conductivity: ~w~n Cost: ~w~n', [Id, Name, Conductivity, Cost]),
    display_metals(Rest).

menu(0) :-
    write('Enter command:'), nl,
    write(' 1 - Add metal'), nl,
    write(' 2 - Delete metal'), nl,
    write(' 3 - Show info about metal'), nl,
    write(' 4 - Show metals with max conductivity'), nl,
    write(' 5 - Show metals with min cost'), nl,
    write(' 6 - Exit'), nl,
    read(Command),
    menu(Command).
menu(1) :-
    write('Enter metal id:'), nl, read(Id),
    write('Enter metal name:'), nl, read(AtomName), atom_string(AtomName, Name),
    write('Enter metal conductivity:'), nl, read(Conductivity),
    write('Enter metal cost:'), nl, read(Cost),
    add_record(Id, Name, Conductivity, Cost),
    menu(0).
menu(2) :-
    write('Enter metal id:'), nl, read(Id),
    delete_record(Id),
    menu(0).
menu(3) :-
    write('Enter metal id:'), nl, read(Id),
    show_info(Id),
    menu(0).
menu(4) :-
    find_max_conductivity,
    menu(0).
menu(5) :-
    find_min_cost,
    menu(0).
menu(6) :-
    write('Ending program execution...'), nl, !.
menu(_) :-
    write('Wrong command or parameter.'), nl,
    menu(0).

main :-
    menu(0).
