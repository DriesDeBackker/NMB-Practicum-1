function [L,R] = Householder_implicit(A)
d = size(A);
m = int8(d(1));
n = int8(d(2));
L = zeros(m,m);
disp('Dit is de matrix A waar we van vertrekken');
disp(A);
disp('Dit is de matrix L waar we van vertrekken');
disp(L);
disp('Dit is de hoogte van A, m');
disp(m);
disp('Dit is de breedte van A, n');
disp(n);
disp('--------------------------------------');
for k = 1:m
    disp('Dit is de waarde van de index k')
    disp(k);
    x = A(k:m,k);
    disp('Dit is de vector x');
    disp(x);
    s = sign(x(1));
    disp('Dit is het teken van x(1)');
    disp(s);
    x_2norm = norm(x);
    disp('Dit is de 2-norm van x');
    disp(x_2norm);
    e_k = zeros(m-k+1,1);
    e_k(1) = 1;
    disp('Dit is de eenheidsvector e_k');
    disp(e_k);
    v = s*x_2norm*e_k + x;
    disp('Dit is de vector v');
    disp(v);
    v_normal = v/norm(v);
    disp('Dit is de genormaliseerde vector v, v_normal');
    disp(v_normal);
    F = eye(m-k+1,m-k+1) - 2*(v_normal*ctranspose(v_normal));
    disp('Dit is de Householder reflector F');
    disp(F);
    A(k:m,k:n) = F*A(k:m,k:n);
    disp('Dit is de bewerkte matrix A');
    disp(A);
    L(k:m,k) = v_normal;
    disp('Dit is de bewerkte matrix l');
    disp(L);
    
    disp('---------------------------------------');
end
    R = A;