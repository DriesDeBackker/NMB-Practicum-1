n = 10;
A = rand(n,n)
x = rand(n,1)
b = A*x

[Q, R] = Householder_explicit(A)
y1 =sym('y1',[1 n]);
x1 =sym('x1',[1 n]);
eqn1 = Q*y1 == b
y1 = solve(eqn1,y1)
eqn2 = R*x == y
x1 = solve(eqn2,x1)


