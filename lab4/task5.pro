% path(1, 2).
% path(2, 4).
% path(2, 5).
% path(1, 3).
% path(3, 6).
% path(6, 9).
% path(9, 10).
% path(10, 5).
% path(6, 7).
% path(9, 8).
% path(7, 8).

% available_path(X, Y) :-
%     path(X, Y).

% available_path(A, B) :-
%     path(A, B),
%     available_path(A, Z).

goes_to(6, 9).
goes_to(6, 7).
goes_to(7, 8).
goes_to(9, 8).
goes_to(9, 10).
goes_to(10, 5).
goes_to(2, 5).
goes_to(2, 4).
goes_to(1, 2).
goes_to(1, 3).
goes_to(3, 6).

check_road(P1, P2) :-
    goes_to(P1, P2).

check_road(P1, P2) :- 
    goes_to(P1, SomeP),
    check_road(SomeP, P2).