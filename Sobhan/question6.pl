start(s1).
final(s1).

transition(s1,a,s2).
transition(s2,a,s2).
transition(s2,b,s1).
transition(s2,c,s4).
transition(s3,a,s1).
transition(s3,b,s4).
transition(s4,d,s3).

accept(Xs) :- start(S),path(S,Xs).
path(S, [X|Xs]) :- transition(S,X,S1), path(S1,Xs).
path(S,[]):- final(S).

