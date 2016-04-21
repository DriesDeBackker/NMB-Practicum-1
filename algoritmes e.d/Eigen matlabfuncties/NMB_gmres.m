function [x,itx,res] = NMB_gmres(A,b,maxit)

% Q1(:,1) = b/norm(b);

itx = [];
[k p]=size(b);
e1 = zeros(1,k);
e1(1,1) = 1;
e1 = transpose(e1);
res = [];

Q(:,1) = b/norm(b);
% [r,s] = size(b);
% x = rand(r,1);
% r0 = b - A*x;
% v = r0/norm(r0);

for n = 1:maxit
    
    v = A*Q(:,n);
    for j = 1:n
        H(j,n) = Q(:,j)'*v;
        v = v - H(j,n)*Q(:,j);
    end
    H(n+1,n) = norm(v);
    if H(n+1,n) <= 0,
        break;
    end
    Q(:,n+1) = v/H(n+1,n)
    
    Hn = Q(:,1:n)'*A*Q(:,1:n);
    
    [m,o] = size(Hn);
    
    y = linsolve(Hn,norm(b)*e1(1:m));    %Zoek y om ||Hny - ||b||e1|| te minimaliseren
    
    
%     residu = norm(Hn*y - norm(b)*e1(1:m));
    res = [res norm(Hn*y - norm(b)*e1(1:m))];
    
    
    x = Q(:,1:n) * y;
    
%     xm = b - A*x;
%     res = [res norm(xm)]
%     v = xm/norm(xm)

    itx = [itx x];
end




