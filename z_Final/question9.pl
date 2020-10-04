lucas(1, [2]).
lucas(2, [1,2]).
lucas(N, [S,X,Y|Z]) :-
    N > 2,
    T is N - 1,
    lucas(T, [X,Y|Z]),
    S is X + Y.

luc_seq(N,L):-
  lucas(N, L1), reverse(L1,L), !.
