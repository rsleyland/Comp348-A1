not(0,1).
not(1,0).

and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).

or(X,Y,Z,Output):- or(X,Y,Temp), or(Temp,Z,Output).
or(A,B,C,D,Output):- or(A,B,Temp1), or(C,D,Temp2),
    or(Temp1,Temp2,Output).
or(A,B,C,D,E,Output):- or(A,B,C,D,Temp), or(E,Temp,Output).

and(X,Y,Z,Output):- and(X,Y,Temp), and(Z,Temp,Output).


circuit(A,B,C,D,[Aout,Bout,Cout,Dout,Eout,Fout,Gout]):-
    not(B,Bn),not(C,Cn),not(D,Dn),
    and(Bn,Dn,BnDn), and(B,D,BD), and(B,Dn,BDn),
    and(C,D,CD), and(Cn,Dn,CnDn),and(C,Dn,CDn),
    and(B,Cn,D,BCnD), and(Bn,C,BnC), and(B,Cn,BCn),
    or(A,BnDn,BD,C,Aout),
    or(A,Bn,CD,CnDn,Bout),
    or(B,D,CnDn,Cout),
    or(A,BnDn,CDn,BCnD,BnC,Dout),
    or(BnDn,CDn,Eout),
    or(A,BDn,CnDn,BCn,Fout),
    or(A,CDn,BnC,BCn,Gout).
