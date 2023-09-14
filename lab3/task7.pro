country('Russia', 'Moscow', 146599183, 'Europe').
country('China', 'Beijing', 1403500365, 'Asia').
country('India', 'New Delhi', 1352642280, 'Asia').
country('United States', 'Washington, D.C.', 331002651, 'North America').
country('Brazil', 'Brasília', 212559417, 'South America').
country('Nigeria', 'Abuja', 206139587, 'Africa').
country('Australia', 'Canberra', 25499884, 'Australia').
country('France', 'Paris', 65273511, 'Europe').
country('Japan', 'Tokyo', 126476461, 'Asia').
country('Canada', 'Ottawa', 37742154, 'North America').

list_countries_info :-
    country(Name, Capital, Population, Region),
    format('Country: ~w~nCapital: ~w~nPopulation: ~w~nRegion: ~w~n~n', [Name, Capital, Population, Region]).

list_countries_gt_pop(X) :-
    country(Name, Capital, Population, Region),
    Population > X,
    format('Country: ~w~nCapital: ~w~nPopulation: ~w~nRegion: ~w~n~n', [Name, Capital, Population, Region]).

list_european_countries_lte_pop(X) :-
    country(Name, Capital, Population, 'Europe'),
    Population =< X,
    format('Country: ~w~nCapital: ~w~nPopulation: ~w~nRegion: ~w~n~n', [Name, Capital, Population, 'Europe']).