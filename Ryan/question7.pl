inv(0,1).
inv(1,0).
or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).
and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

a(A,B,C,D,Out):-
  inv(B,B1), inv(D,D1),
  and(B,D,BD), and(B1,D1,B1D1),
  or(BD,B1D1,O1), or(A,C,O2), or(O1,O2,Out).

b(A,B,C,D,Out):-
  inv(B,B1), inv(C,C1), inv(D,D1),
  and(C,D,CD), and(C1,D1,C1D1),
  or(CD,C1D1,O1), or(A,B1,O2), or(O1,O2,Out).

c(_,B,C,D,Out):-
  inv(C,C1), inv(D,D1),
  and(C1,D1,C1D1),
  or(C1D1,C1D1,O1), or(B,D,O2), or(O1,O2,Out).

d(A,B,C,D,Out):-
  inv(B,B1), inv(C,C1), inv(D,D1),
  and(B1,D1,B1D1), and(C,D1,CD1), and(B,C1,BC1), and(BC1,D,BC1D), and(B1,C,B1C),
  or(B1D1,CD1,O1), or(BC1D,B1C,O2), or(O1,O2,O3), or(A,O3,Out).

e(_,B,C,D,Out):-
  inv(B,B1), inv(D,D1),
  and(C,D1,CD1), and(B1,D1,B1D1),
  or(CD1,B1D1,Out).

f(A,B,C,D,Out):-
  inv(C,C1), inv(D,D1),
  and(B,D1,BD1), and(C1,D1,C1D1), and(B,C1,BC1),
  or(BD1,C1D1,O1), or(BC1,A,O2), or(O1,O2,Out).

g(A,B,C,D,Out):-
  inv(B,B1), inv(C,C1), inv(D,D1),
  and(C,D1,CD1), and(B1,C,B1C), and(B,C1,BC1),
  or(CD1,B1C,O1), or(BC1,A,O2), or(O1,O2,Out).

decoder(1,1,1,1,1,1,0,0).
decoder(0,1,1,0,0,0,0,1).
decoder(1,1,0,1,1,0,1,2).
decoder(1,1,1,1,0,0,1,3).
decoder(0,1,1,0,0,1,1,4).
decoder(1,0,1,1,0,1,1,5).
decoder(1,0,1,1,1,1,1,6).
decoder(1,1,1,0,0,0,0,7).
decoder(1,1,1,1,1,1,1,8).
decoder(1,1,1,1,0,1,1,9).

get_output_lines(A,B,C,D):-
  a(A,B,C,D,Oa),
  b(A,B,C,D,Ob),
  c(A,B,C,D,Oc),
  d(A,B,C,D,Od),
  e(A,B,C,D,Oe),
  f(A,B,C,D,Of),
  g(A,B,C,D,Og),
  write('\na b c d e f g\n'),
  write(Oa-Ob-Oc-Od-Oe-Of-Og),
  !.

get_output_display(A,B,C,D):-
  a(A,B,C,D,Oa),
  b(A,B,C,D,Ob),
  c(A,B,C,D,Oc),
  d(A,B,C,D,Od),
  e(A,B,C,D,Oe),
  f(A,B,C,D,Of),
  g(A,B,C,D,Og),
  decoder(Oa,Ob,Oc,Od,Oe,Of,Og, X),
  write('Displayed value = '),
  write(X),!.
