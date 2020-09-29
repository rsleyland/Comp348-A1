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
class(comp348,"Principles of Programming Languages").
class(comp352,"Data Structures & Algorithms").
class(comp361,"Elementary Numerical Methods").
class(engr371,"Probability and Statistics").
class(engr391,"Numerical Methods in Engineering").
class(engr392,"Impact of Technology on Society").
class(mast218,"Multivariate Calculus I").
class(phys284,"Introduction to Astronomy").
class(soen287,"Web Programming").
class(soen341,"Software Process").

%return courses taken by each person (string info included)
courses_by_student(X,Z,A):-
  teammember(X,_), findall(Y, student(X,Y),L), member(Z,L), class(Z,A).

%return list of courses taken by each person
list_courses_student(X,L):-
  teammember(X,_), findall(Y,student(X,Y),L).

%return size of team
size([],0).
size([_|T],N):- size(T,N1), N is N1+1.
team_size(N):-
  findall(X,teammember(X,_),L), size(L,N).

%return all courses taken by the whole team
list_all_classes(L) :- findall(X,student(_,X),L).

%return previous list without duplicates using sort/2
sort_list(L1) :- list_all_classes(L), sort(L,L1).

%unify expression with above result
unify_list([A,B|C]):- sort_list(X), X = [A,B|C].


%alternate method to find all student classes and remove duplicates using list_to_set/2
unique_classes(Z,S):- findall(X,student(_,X),L), list_to_set(L,S), member(Z,S).
