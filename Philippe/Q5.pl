student('Sobhan', 40122438).
student('Amr', 40082583).
student('Philippe', 40153985).
student('Ryan', 40015165).

course('SOEN341', 'Software Process').
course('COMP348', 'Principle of Programming Language').
course('COMP352', 'Data Structure and Algorithm').
course('SOEN287', 'Web Programming').
course('MAST218', 'Multivariable Calculus I').
course('ENGR371', 'Probability and Statistics').
course('PHYS284', 'Introduction to Astronomy').
course('COMP361', 'Elementary Numerical Methods').
course('ENCS282', 'Technical Writing and Communication').
course('ENGR391', 'Numerical Methods in Engineering').
course('ENGR392', 'Impact of Technology on Society').

class('Sobhan', 'COMP348').
class('Sobhan', 'COMP352').
class('Sobhan', 'SOEN287').
class('Sobhan', 'MAST218').
class('Amr', 'COMP348').
class('Amr', 'COMP352').
class('Amr', 'ENGR371').
class('Amr', 'PHYS284').
class('Philippe', 'COMP348').
class('Philippe', 'PHYS284').
class('Philippe', 'ENCS282').
class('Philippe', 'COMP361').
class('Philippe', 'SOEN341').
class('Ryan', 'COMP348').
class('Ryan', 'COMP352').
class('Ryan', 'ENGR391').
class('Ryan', 'ENGR392').
class('Ryan', 'PHYS284').


teamSize(S) :- findall(X, student(X, _), Xs), length(Xs, S).

% course taken by each person
courseList(L) :- student(X, _), findall(Y, class(X, Y), L).

% unique course taken by the whole team
uniqueCourse(Y) :-
    course(Y, _),
    findall(X, class(X, Y), L),
    length(L, Len),
    Len = 1.
uniqueCourseList(L) :- findall(C, uniqueCourse(C), L).

sortedUniqueCourseList(L) :-
    uniqueCourseList(U),
    sort(U, L).

unify([A,B|C]) :-
    sortedUniqueCourseList(L),
    L = [A, B|C].
