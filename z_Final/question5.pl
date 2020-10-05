teammember(ryan, 40015165).
teammember(sobhan, 40122438).
teammember(amr, 40082583).
teammember(philippe, 40153985).
student(ryan, comp348).
student(sobhan, comp348).
student(amr, comp348).
student(philippe, comp348).
student(ryan, comp352).
student(sobhan, comp352).
student(amr, comp352).
student(philippe, comp361).
student(ryan, engr391).
student(amr, engr371).
student(philippe, encs282).
student(ryan, engr392).
student(sobhan, mast218).
student(amr, phys284).
student(sobhan, soen287).
student(philippe, soen341).
student(philippe, phys284).
student(ryan, phys284).


%return list of courses taken by each person
list_courses_student(X,L):-
  teammember(X,_), findall(Y,student(X,Y),L).

%return size of team
% size([],0).
% size([_|T],N):- size(T,N1), N is N1+1.
team_size(N):-
  findall(X,teammember(X,_),L), length(L,N).

%return all unique courses taken by the team
list_all_classes(L1) :- findall(X,student(_,X),L), list_to_set(L,L1).

%return previous list sorted using sort/2
sort_list(L1) :- list_all_classes(L), sort(L,L1).

%unify expression with above result
% A = comp349
% B = comp352
% C = [comp361, encs282, engr371, engr391, engr392, mast218, phys284, soen287, soen341]
unify_list([A,B|C]):- sort_list(X), X = [A,B|C].
