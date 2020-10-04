start(s1).
final(s1).

transition(s1,a,s2).
transition(s2,a,s2).
transition(s2,b,s1).
transition(s2,c,s4).
transition(s3,a,s1).
transition(s3,b,s4).
transition(s4,d,s3).

accept(X) :- start(Q), path(Q,X).
path(Q,[X|Y]) :- transition(Q,X,P), path(P,Y).
path(Q,[]) :- final(Q).

% accept([a,a,b]). will return true
% It can be seen from the diagram that the FSM starts at s1
% traversing along the paths a, a and then b will result
% in the return to s1, which is a final state
% ... machine is happy, will return true
