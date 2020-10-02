teammember(ryan, 40015165).
teammember(sobhan, 40122438).
teammember(amr, 40082583).
teammember(philippe, 40153985).
student(ryan, comp348, "Principles of Programming Languages").
student(sobhan, comp348, "Principles of Programming Languages").
student(amr, comp348, "Principles of Programming Languages").
student(philippe, comp348, "Principles of Programming Languages").
student(ryan, comp352, "Data Structures & Algorithms").
student(sobhan, comp352, "Data Structures & Algorithms").
student(amr, comp352, "Data Structures & Algorithms").
student(philippe, comp361, "Elementary Numerical Methods").
student(ryan, engr391, "Numerical Methods in Engineering").
student(amr, engr371, "Probability and Statistics").
student(philippe, encs282, "Technical Writing and Communication").
student(ryan, engr392, "Impact of Technology on Society").
student(sobhan, mast218, "Multivariate Calculus I").
student(amr, phys284, "Introduction to Astronomy").
student(sobhan, soen287, "Web Programming").
student(philippe, soen341, "Software Process").
student(philippe, phys284, "Introduction to Astronomy").
student(ryan, phys284, "Introduction to Astronomy").


%return list of courses taken by each person
list_courses_student(X,L):-
  teammember(X,_), findall(Y,student(X,Y,_),L).

%return size of team
size([],0).
size([_|T],N):- size(T,N1), N is N1+1.
team_size(N):-
  findall(X,teammember(X,_),L), size(L,N).

%return all unique courses taken by the team 
list_all_classes(L1) :- findall(X,student(_,X),L), list_to_set(L,L1).

%return previous list sorted using sort/2
sort_list(L1) :- list_all_classes(L), sort(L,L1).

%unify expression with above result
unify_list([A,B|C]):- sort_list(X), X = [A,B|C].

