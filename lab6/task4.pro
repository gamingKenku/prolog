fusion(L1,[ ],L1) :- !. 
fusion([ ],L2,L2) :- !. 
fusion([H1|T1],[H2|T2],[H1|T]) :-
    H1<H2,!,
    fusion(T1, [H2|T2],T).
fusion(L1, [H2|T2],[H2|T]) :-
    fusion(L1,T2,T).
