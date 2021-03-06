n = 100;
c = 1;
A = rand(n,n);
[U,S,V] = svd(A);
S = diag(linspace(c,1,n));
A = U*S*V';
    
x = rand(n,1)
b = A*x

tic
timing1 = tic
[Q, R] = Householder_explicit(A)
y1 = linsolve(Q,b)
x1 = linsolve(R,y1)
toc

tic
timing2 = tic
[L,R] = Householder_implicit(A)
y2 = Apply_Q(L,b)
x2 = linsolve(R,y2)
toc


