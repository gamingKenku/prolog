% for(N, N, N).

% for(N1, N2, X) :-
%     N1 =< N2,
%     X is N1,
%     N1_next is N1 + 1,
%     for(N1_next, N2, _).

for(N1, N2, N1) :- N1 =< N2.
for(N1, N2, X) :- 
    N1 < N2, 
    N1_next is N1 + 1, 
    for(N1_next, N2, X).
