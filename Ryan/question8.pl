second_half(L,S):-
  append(F,S,L),
  length(F,N),
  length(S,N1),
  (N<N1 -> fail ; !).
