%----------method 1----------

lucas(1, [2]).
lucas(2, [1,2]).
lucas(N, [S,X,Y|Z]) :-
    N > 2,
    T is N - 1,
    lucas(T, [X,Y|Z]),
    S is X + Y.

luc_seq3(N,L):-
  lucas(N, L1), reverse(L1,L), !.

%----------method 2----------

luc_seq2(N,P):-
  add_to_list(N, L, P).

add_to_list(N, L, P):-
  (N=:=0 -> P = L, ! ;
  N1 is N-1,
  luc_num(N,A),
  add(A,L,O),
  add_to_list(N1, O, P)),
  !.

add(X,[],[X]).
add(X,List,[X|List]).

luc_num(1, 2) :- !.
luc_num(2, 1) :- !.
luc_num(N, R) :- N>1, N1 is N - 1, N2 is N - 2,
  luc_num(N1, R1), luc_num(N2, R2), R is R1 + R2.
