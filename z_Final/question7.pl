circuit(A,B,C,D):-
  inv(B,BI),inv(C,CI),inv(D,DI),
  and(BI,DI,BIDI),and(B,D,BD),and(B,DI,BDI),
  and(C,D,CD),and(CI,DI,CIDI),and(C,DI,CDI),
  and(BI,C,BIC),and(B,CI,BCI),and(BCI,D,BCID),
  % a
  or(A,BIDI,BD,ABIDIBD), or(ABIDIBD,C,AO),
  % b
  or(A,BI,CD,ABICD), or(ABICD,CIDI,BO),
  % c
  or(B,D,CIDI,CO),
  % d
  or(A,BIDI,CDI,ABIDICDI), or(ABIDICDI,BCID,BIC,DO),
  % e
  or(BIDI,CDI,EO),
  % f
  or(A,BDI,CIDI,ABDICIDI), or(ABDICIDI,BCI,FO),
  % g
  or(A,CDI,BIC,ACDIBIC), or(ACDIBIC, BCI, GO),
  decoder(AO,BO,CO,DO,EO,FO,GO,Output),
  write('Success\n'),
  format('a=~w b=~w c=~w d=~w e=~w f=~w g=~w\n',[AO,BO,CO,DO,EO,FO,GO]),
  format('Output is ~w ',[Output]), !.

inv(0,1).
inv(1,0).
or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).
or(0,0,0,0).
or(0,0,1,1).
or(0,1,0,1).
or(0,1,1,1).
or(1,0,0,1).
or(1,0,1,1).
or(1,1,0,1).
or(1,1,1,1).
and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

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
