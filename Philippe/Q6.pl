% 1. Represent in Prolog

start(s1).
end(s1).
transition(s1, a, s2).
transition(s2, a, s2).
transition(s2, b, s1).
transition(s2, c, s4).
transition(s3, a, s1).
transition(s3, b, s4).
transition(s4, d, s3).

% 2. Query
% database
accect(X) :- start(S), path(S, X).
path(S, [H|T]) :- transition(S, H, E), path(E, T)
path(S, []) :- final(S).

?- accect([a, a, b])

% 3. Explain
accect([a, a, b]) :- start(S), path(S, [a, a, b])
start(S) = start(s1)
S = s1
path(s1, [a, a, b]) :- transition(s1, a, E), path(E, [a, b])
transition(s1, a, E) = transition(s1, a, s2)
E = s2
path(s2, [a, b]) :- transition(s2, a, E), path(E, [b])
transition(s2, a, E) = transition(s2, a, s2)
E = s2
path(s2, [b]) :- transition(s2, b, E), path(E, [])
transition(s2, b, E) = transition(s2, b, s1)
E = s1
path(s1, []) :- final(s1)
final(s1) = final(s1)
true