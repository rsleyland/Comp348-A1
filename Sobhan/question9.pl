
lucas_num(1,[2]).
lucas_num(2,[2,1]).
lucas_num(N,Out):- M is N-1, lucas_num(M,Temp1), last_two(Temp1,A,B),
    C is A + B, append(Temp1,[C],Out).

last_two([A,B],A,B).
last_two([_|T],A,B):- last_two(T,A,B).
