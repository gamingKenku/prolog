% (X+6)2+Y/lg(3.56)
% (25+Y+X2)/(6YX*sin(330o))


expression_one(X, Y) :-
    Res is (X+6)**2+Y/log10(3.56),
    write(Res).

expression_two(X, Y) :-
    Res is (25+Y+X**2)/(6*Y*X*sin(5.75959)),
    write(Res).
