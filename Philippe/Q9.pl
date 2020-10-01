lucasList(0, [2]) :- !.
lucasList(1, [1,2]) :- !.
lucasList(N, [W,X,Y|Z]) :-
    N > 1,
    N1 is N-1,
    lucasList(N1, [X, Y|Z]),
    W is X+Y.

lucas(N, Seq) :-
    lucasList(N, RSeq),
    reverse(RSeq, Seq).