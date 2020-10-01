second_half(List, Out) :-
  length(List, L),
  Half is round(L/2),
  separate(List, Half, Out).

separate(List, 0, List) :- !.
separate([_|T], L, Out) :-
  L1 is L-1,
	separate(T, L1, Out).