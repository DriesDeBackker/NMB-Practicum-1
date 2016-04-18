function [Q,R] = Householder_explicit(A)
d = size(A);
m = int8(d(1));
n = int8(d(2));
Q = eye(m,m);
%disp('Dit is de matrix A waar we van vertrekken');
%disp(A);
%disp('Dit is de matrix Q waar we van vertrekken');
%disp('Dit is de hoogte van A, m');
%disp(m);
%disp('Dit is de breedte van A, n');
%disp(n);
%disp('--------------------------------------');
for k = 1:m
    %disp('Dit is de waarde van de index k')
    %disp(k);
    x = A(k:m,k)
    %disp(x);
    s = sign(x(1))
    %disp(s);
    x_2norm = norm(x)
    e_k = zeros(m-k+1,1);
    e_k(1) = 1;
    %disp('Dit is de eenheidsvector e_k');
    %disp(e_k);
    v = s*x_2norm*e_k + x
    v_normal = v/norm(v);
    %disp('Dit is de genormaliseerde vector v, v_normal');
    %disp(v_normal);
    F = eye(m-k+1,m-k+1) - 2*(v_normal*ctranspose(v_normal));
    %disp('Dit is de Householder reflector F');
    %disp(F);
    A(k:m,k:n) = F*A(k:m,k:n);
    %disp('Dit is de bewerkte matrix A');
    %disp(A);
    Qk = zeros(m,m);
    Qk(1:k-1,1:k-1) = eye(k-1,k-1);
    Qk(k:m,k:m) = F;
    Q = Q*Qk;
    %disp('Dit is de bewerkte matrix Q');
    %disp(Q);
    
    disp('---------------------------------------');
end
    R = A;