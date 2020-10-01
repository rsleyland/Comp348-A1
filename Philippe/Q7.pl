% a) Implement the above circuit in PROLOG
% Database

inv(0, 1)
inv(1, 0)

and(0, 0, 0)
and(0, 1, 0)
and(1, 0, 0)
and(1, 1, 1)
and(0, 0, 0, 0)
and(0, 0, 1, 0)
and(0, 1, 0, 0)
and(0, 1, 1, 0)
and(1, 0, 0, 0)
and(1, 0, 1, 0)
and(1, 1, 0, 0)
and(1, 1, 1, 1)

or(0, 0, 0)
or(0, 1, 1)
or(1, 0, 1)
or(1, 1, 1)
or(0, 0, 0, 0)
or(0, 0, 1, 1)
or(0, 1, 0, 1)
or(0, 1, 1, 1)
or(1, 0, 0, 1)
or(1, 0, 1, 1)
or(1, 1, 0, 1)
or(1, 1, 1, 1)
or(0, 0, 0, 0, 0)
or(0, 0, 0, 1, 1)
or(0, 0, 1, 0, 1)
or(0, 0, 1, 1, 1)
or(0, 1, 0, 0, 1)
or(0, 1, 0, 1, 1)
or(0, 1, 1, 0, 1)
or(0, 1, 1, 1, 1)
or(1, 0, 0, 0, 1)
or(1, 0, 0, 1, 1)
or(1, 0, 1, 0, 1)
or(1, 0, 1, 1, 1)
or(1, 1, 0, 0, 1)
or(1, 1, 0, 1, 1)
or(1, 1, 1, 0, 1)
or(1, 1, 1, 1, 1)

or(0, 0, 0, 0, 0, 0)
or(0, 0, 0, 0, 1, 1)
or(0, 0, 0, 1, 0, 1)
or(0, 0, 0, 1, 1, 1)
or(0, 0, 1, 0, 0, 1)
or(0, 0, 1, 0, 1, 1)
or(0, 0, 1, 1, 0, 1)
or(0, 0, 1, 1, 1, 1)
or(0, 1, 0, 0, 0, 1)
or(0, 1, 0, 0, 1, 1)
or(0, 1, 0, 1, 0, 1)
or(0, 1, 0, 1, 1, 1)
or(0, 1, 1, 0, 0, 1)
or(0, 1, 1, 0, 1, 1)
or(0, 1, 1, 1, 0, 1)
or(0, 1, 1, 1, 1, 1)
or(1, 0, 0, 0, 0, 1)
or(1, 0, 0, 0, 1, 1)
or(1, 0, 0, 1, 0, 1)
or(1, 0, 0, 1, 1, 1)
or(1, 0, 1, 0, 0, 1)
or(1, 0, 1, 0, 1, 1)
or(1, 0, 1, 1, 0, 1)
or(1, 0, 1, 1, 1, 1)
or(1, 1, 0, 0, 0, 1)
or(1, 1, 0, 0, 1, 1)
or(1, 1, 0, 1, 0, 1)
or(1, 1, 0, 1, 1, 1)
or(1, 1, 1, 0, 0, 1)
or(1, 1, 1, 0, 1, 1)
or(1, 1, 1, 1, 0, 1)
or(1, 1, 1, 1, 1, 1)


% Circuit
circuit(A, B, C, D, OutA, OutB, OutC, OutD, OutE, OutF, OutG) :-
    inv(B, InvB),
    inv(C, InvC),
    inv(D, InvD),
    and(InvB, InvD, And1),
    and(B, D, And2),
    and(B, InvD, And3),
    and(C, D, And4),
    and(InvC, InvD, And5),
    and(C, InvD, And6),
    and(B, InvC, D, And7),
    and(InvB, C, And8),
    and(B, InvC, And9),
    or(A, And1, And2, C, OutA),
    or(A, InvB, And4, And5, OutB),
    or(B, D, And5, OutC),
    or(A, And1, And6, And7, And8, OutD),
    or(And1, And6, OutE),
    or(A, And3, And5, And9, OutF),
    or(A, And6, And8, And9, OutG).

% b) Write the query
?- circuit(0,1,0,1,OutA,OutB,OutC,OutD,OutE,OutF,OutG)
  OutA = 1,
  OutB = 0,
  OutC = 1,
  OutD = 1,
  OutE = 0,
  OutF = 1,
  OutG = 1.