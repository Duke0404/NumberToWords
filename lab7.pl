% Numbers 0-19
to_words(0) :- write('zero').
to_words(1) :- write('one').
to_words(2) :- write('two').
to_words(3) :- write('three').
to_words(4) :- write('four').
to_words(5) :- write('five').
to_words(6) :- write('six').
to_words(7) :- write('seven').
to_words(8) :- write('eight').
to_words(9) :- write('nine').
to_words(10) :- write('ten').
to_words(11) :- write('eleven').
to_words(12) :- write('twelve').
to_words(13) :- write('thirteen').
to_words(14) :- write('fourteen').
to_words(15) :- write('fifteen').
to_words(16) :- write('sixteen').
to_words(17) :- write('seventeen').
to_words(18) :- write('eighteen').
to_words(19) :- write('nineteen').

% Numbers 20-99
to_words(N) :-
    N >= 20,
    N < 100,
    Ones is N mod 10,
    Tens is N - Ones,
    tens(Tens, TensWord),
    write(TensWord),
    (Ones > 0 -> write(' '), to_words(Ones) ; true),
    !.

% Numbers 100-999
to_words(N) :-
    N >= 100,
    N < 1000,
    Hundreds is N div 100,
    Remainder is N mod 100,
    to_words(Hundreds),
    write(' hundred'),
    (Remainder = 0 -> true ; write(' and '), to_words(Remainder)),
    !.

% Numbers less than 0
to_words(N) :-
    N < 0,
    write('minus '),
    Absolute is abs(N),
    to_words(Absolute),
    !.

% Numbers 1000
to_words(1000) :- write('one thousand'), !.

% Wrapper
to_words(N) :-
    (N > 1000 ; N < -1000) ->
    write('Out of range') ;
    true.

% Tens words
tens(20, twenty).
tens(30, thirty).
tens(40, forty).
tens(50, fifty).
tens(60, sixty).
tens(70, seventy).
tens(80, eighty).
tens(90, ninety).
