% 1. ?- field(hit_transfer, engineering). => ground

field(hit_transfer, engineering) = field(X, Y) :- course(X,Z), field(Z, Y)
X = hit_transfer
Y = engineering

course(hit_transfer, Z) = course(hit_transfer, mechanical)
Z = mechanical

?- field(mechanical, engineering) = field(mechanical, engineering)
true

% 2. ?- lab_number(fine_arts, X). => non-ground

lab_number(fine_arts, X) = lab_number(fine_arts, 10)
X = 10

% 3. ?- field(computer, literature). => ground

?- field(computer, literature) = field(computer, engineering)
false

% 4. course(X, Y). => non-ground

course(X, Y) = course(hit_transfer, mechanical)
X = hit_transfer,
Y = mechanical;
course(X, Y) = course(web_design, computer)
X = web_design,
Y = computer;
course(X, Y) = course(design_methods, fine-arts)
X = design_methods,
Y = fine_arts;
course(X, Y) = course(poetry, literature)
X = poetry,
Y = literature;
course(X, Y) = course(leadership, management)
X = leadership,
Y = management;
course(X, Y) = course(biology, medicin)
X = biology,
Y = medicin;

% 5. ?- student(adrian). => ground

student(adrian) = student(X) :- student(X, _)
X = adrian
?- student(adrian, _) = student(adrian, web_design)
true

% 6. ?- student(anna, engineering). => ground

student(anna, engineering) = student(anna, hit_transfer)
false

% 7. ?- student(X, engineering). => non-ground

student(X, engineering) = student(X, Y) :- field(Z, Y), student(X, Z)
Y = engineering
field(Z, engineering) = field(mechanical, engineering)
Z = mechanical,
field(Z, engineering) = field(computer, engineering)
Z = computer

student(X, mechanical) =

% 8. ?- student(X, fine-arts), course(fine_arts, Y). => non-ground

student(X, fine-arts) = student(X, L) :- field(Z, L), student(X, Z)
L = fine_arts
field(Z, fine_arts)


% 9. ?- field(_, X). => non-ground

field(_, X) = field(mechanical, engineering)
X = engineering
field(_, X) = field(computer, engineering)
X = engineering
field(_, X) = field(fine_arts, art)
X = art
field(_, X) = field(literature, social)
X = social
field(_, X) = field(management, business)
X = business


% 10. ?- lab_number(_, X), field(X, Y)

lab_number(_, X) = lab_number(mechanical, 15)

% 11. ?- lab_number(X, 15), field(X, Y) => non-ground

lab_number(X, 15) = lab_number(mechanical, 15)
X = mechanical
field(mechanical, Y) = field(mechanical, engineering)
Y = engineering

% 12. ?- student(X), !, student(X, _).




% 13. ?- student(X), student(X, _), !.



% 14. ?- course(X, _), \+ student(_, X)

course(X, _) = course(hit_transfer, mechanical)
X = hit_transfer
student(_, hit_transfer) = student(anna, hit_transfer)
true
course(X, _) = course(web_design, computer)
X = web_design
student(_, web_design) = student(adrian, web_design)
true
course(X, _) = course(design_methods, fine_arts)
X = design_methods
student(_, design_methods) = student(ava, design_methods)
true
course(X, _) = course(poetry, literature)
X = poetry
student(_, poetry) = student(jack, poetry)
true
course(X, _) = course(leadership, management)
X = leadership
student(_, leadership) = student(lee, leadership)
true
course(X, _) = course(biology, medicin)
X = biology
student(_, biology) = student(anna, hit_transfer)
false

X = biology