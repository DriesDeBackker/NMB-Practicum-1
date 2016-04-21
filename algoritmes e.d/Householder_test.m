n = 1000;
c = 10^8;
A = rand(n,n);
[U,S,V] = svd(A);
S = diag(linspace(c,1,n));
A = U*S*V';
    
x = rand(n,1);
b = A*x;
b_norm = norm(b);
x_norm = norm(x);

tic
[Q, R] = Householder_explicit(A);
y1 = linsolve(Q,b);
x1 = linsolve(R,y1);
toc
t1 = toc
r1 = x-x1;
r1_norm = norm(r1);

tic
[L,R] = Householder_implicit(A);
y2 = Apply_Q(L,b);
x2 = linsolve(R,y2);
toc
t2 = toc
r2 = x-x2;
r2_norm = norm(r2);




