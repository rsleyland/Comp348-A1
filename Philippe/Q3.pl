% 1. food(bread, X) = Food(Y, soup) => error
% Food is capitalize

% 2. Bread = soup => success
Bread = soup


% 3. Bread = Soup => success
Bread = Soup


% 4. food(bread, X, milk) = food(Y, salad, X) => error
% X = salad
% X = milk
% milk != salad

% 5. manager(X) = Y => success
Y = manager(X)

% 6. meal(healthyFood(bread), drink(milk)) = meal(X, Y) => success
X = healthyFood(bread)
Y = drink(milk)

% 7. meal(eat(Z), drink(milk)) = [X]


% 8. [eat(Z), drink(milk)] = [X, Y | Z] => success
X = eat(Z)
Y = drink(milk)
Z = []

% 9. f(X, t(b, c)) = f(l, t(Z, c)) => success
X = l
Z = b

% 10. ancestor(french(jean), B) = ancestor(A, scottish(joe)) => success
A = french(jean)
B = scottish(joe)

% 11. meal(healthyFood(bread), Y) = meal(X, drink(water)) => success
X = healthyFood(bread)
Y = drink(water)

% 12. [H|T] = [a, b, c] => success
H = a
T = [b, c]

% 13. [H, T] = [a, b, c] => error
% not the same arity (left is arity 2 and right is arity 3)

% 14. breakfast(healthyFood(bread), egg, milk) = breakfast(healthyFood(Y), Y, Z) => error
Y = bread
Y = egg
bread != egg

% 15. dinner(X, Y, Time) = dinner(jack, cook(egg, oil), Evening) => success
X = jack
Y = cook(egg, oil)
Time = Evening

% 16. k(s(g), Y) = k(X, t(k)) => success
X = s(g)
Y = t(k)

% 17. equation(Z, f(x, 17, M), L*M, 17) = equation(C, f(D, D, y), C, E) => error
D = x
D = 17
17 != x

% 18. a(X, b(c, d), [H|T]) = a(X, b(c, X), b) => error
% b and [H|T] are not the same atom type