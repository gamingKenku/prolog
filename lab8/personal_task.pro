readWords(Stream, []) :-
    at_end_of_stream(Stream).
readWords(InStream, [W|Rest]) :-
    get_code(InStream, Char),
    checkCharAndReadRest(Char, Chars, InStream),
    atom_codes(W, Chars),
    readWords(InStream, Rest).

checkCharAndReadRest(10, [], _) :- !.
checkCharAndReadRest(32, [], _) :- !.
checkCharAndReadRest(-1, [], _) :- !.
checkCharAndReadRest(end_of_file, [], _) :- !.
checkCharAndReadRest(Char, [Char|Chars], InStream) :-
    get_code(InStream, NextChar),
    checkCharAndReadRest(NextChar, Chars, InStream).

has_duplicates(String) :-
    atom_chars(String, Chars),
    msort(Chars, SortedChars),
    check_duplicates(SortedChars).

check_duplicates([X,Y|_]) :- X == Y, !.
check_duplicates([_|T]) :- check_duplicates(T).
    
get_words_with_dupl_chars([], []).
get_words_with_dupl_chars([Head|Tail], [Head|ResList]) :-
    has_duplicates(Head),
    get_words_with_dupl_chars(Tail, ResList).
get_words_with_dupl_chars([_|Tail], ResList) :-
    get_words_with_dupl_chars(Tail, ResList).

task :- 
    open('test.txt', 'read', Stream),
    readWords(Stream, List),
    close(Stream),
    get_words_with_dupl_chars(List, ResList),
    write(ResList).