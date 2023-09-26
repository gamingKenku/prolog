toy('Мягкий медведь', 20, 15).
toy('Конструктор LEGO', 10, 30).
toy('Кукла Барби', 15, 10).
toy('Гоночная машинка', 30, 8).
toy('Пазл "Замок"', 25, 12).
toy('Деревянные кубики', 40, 5).
toy('Надувной меч', 50, 3).
toy('Плюшевый котенок', 18, 20).
toy('Игровая кухня', 8, 35).
toy('Робот-трансформер', 12, 25).

all_toys :-
    toy(Name, Amount, Price),
    format('~w, ~w, ~w~n', [Name, Amount, Price]),
    fail.

all_toys_price :-
    toy(Name, Amount, Price),
    TotalPrice is Amount * Price,
    format('~w, ~w~n', [Name, TotalPrice]),
    fail.

all_toys_price_trace :-
    trace,
    all_toys_price,
    notrace.