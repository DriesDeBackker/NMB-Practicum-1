function [Q,R] = Householder_explicit(A)
d = size(A);
m = int64(d(1));
n = int64(d(2));
Q = eye(m,m);
for k = 1:m
    x = A(k:m,k);
    s = sign(x(1));
    x_2norm = norm(x);
    e_k = zeros(m-k+1,1);
    e_k(1) = 1;
    v = s*x_2norm*e_k + x;
    v_normal = v/norm(v);
    F = eye(m-k+1,m-k+1) - 2*(v_normal*ctranspose(v_normal));
    A(k:m,k:n) = F*A(k:m,k:n);
    Qk = zeros(m,m);
    Qk(1:k-1,1:k-1) = eye(k-1,k-1);
    Qk(k:m,k:m) = F;
    Q = Q*Qk;
end
    R = A;
end