second_half(List,Output):- length(List,N), Half is N/2, half(List, Half, Output).

half(List,N,List):- length(List,Length), Length=< N.
half([_|T],N,List):-length([_|T],Length), Length > N, half(T,N,List).

