
% facts
student("Sobhan Mehrpour Kevishahi",40122438).
student("Amr Hefny",40082583).
student("Philippe Carrier",40153985).
student("Ryan Leyland",40015165).
takes(40122438,comp348).
takes(40122438,comp352).
takes(40122438,soen287).
takes(40122438,mast218).
takes(40082583,comp348).
takes(40082583,comp352).
takes(40082583,engr371).
takes(40082583,phys284).
takes(40153985,comp348).
takes(40153985,comp361).
takes(40153985,encs282).
takes(40153985,soen341).
takes(40153985,phys284).
takes(40015165,comp348).
takes(40015165,comp352).
takes(40015165,engr391).
takes(40015165,engr392).
takes(40015164,phys284).

%rules

% Finds all courses taken by a person
courses(Person,List):-student(Person,ID), findall(C,takes(ID,C),List).

% finds all members of the team
team(L):- findall(X,student(X,_),L).

% returns team size
teamCount(N):- team(L),length(L,N).

%  returns list of unique courses
unique(List):- findall(X, takes(_,X), Temp), list_to_set(Temp,List).

% sorts the unique list
sorted_unique(List):- unique(Temp), sort(Temp,List).

/*
Unifying [A,B|C]:
A = comp348
B = comp352
C = [comp361,encs282,engr371,engr391,engr392,mast218,phys284,soen287,soen341]
*/

