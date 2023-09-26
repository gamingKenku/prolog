flight('AF123', 'Париж', 350).
flight('BA456', 'Лондон', 280).
flight('LH789', 'Франкфурт', 320).
flight('TK101', 'Стамбул', 400).
flight('UA234', 'Нью-Йорк', 500).
flight('EK567', 'Дубай', 600).
flight('SQ890', 'Сингапур', 700).
flight('CA123', 'Пекин', 450).
flight('JL456', 'Токио', 550).
flight('QF789', 'Сидней', 650).

all_flights :-
    flight(Code, Destination, Price),
    format('~w, ~w, ~w~n', [Code, Destination, Price]),
    fail.

find_destination(Code) :-
    flight(Code, Destination, _),
    format('~w~n', [Destination]).

find_cheaper_flights(TargetPrice) :- 
    flight(Code, Destination, Price),
    Price < TargetPrice,
    format('~w, ~w, ~w~n', [Code, Destination, Price]),
    fail.