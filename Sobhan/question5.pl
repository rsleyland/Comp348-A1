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

% All courses taken by person.
% query is either courses(Person,List);
% or is student(Person,ID), findall(C,takes(ID,C),List).

courses(Person,List):-student(Person,ID), findall(C,takes(ID,C),List).

% Number of team mates
% Query is either teamCount(N)
% or is findall(X,student(X,_),L),length(L,N).

team(L):- findall(X,student(X,_),L).
teamCount(N):- team(L),length(L,N).

% Unique Courses
% Query is either unique(List)
% or is findall(X, takes(_,X),Temp), list_to_set(Temp,List).

unique(List):- findall(X, takes(_,X),Temp), list_to_set(Temp,List).

% Sorted unique list
% Query is either sorted_unique(List)
% or is findall(X, takes(_,X),Temp), list_to_set(Temp,List),
% sort(List,Sorted).
sorted_unique(List):- unique(Temp),sort(Temp,List).


