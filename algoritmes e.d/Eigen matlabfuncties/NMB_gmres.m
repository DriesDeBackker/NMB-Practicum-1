function [x,itx] = NMB_gmres(A,b,maxit)

Q1(1,:) = b/norm(b);
itx = []
for n = 1:maxit
    [H,Q_a] = arnoldi(A,b,n);
    [Q,R] = qr(H);
    D = Q'*norm(b)
    [y] = solve(R*y = D,y);
    x = Q_a * y;
    itx = [itx x]
end

    
    

