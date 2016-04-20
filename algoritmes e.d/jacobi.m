function [V, D] = jacobi(A, tol)
disp('De matrix waar we van vertrekken');
disp(A);
dim = size(A);
m = dim(1);
J = eye(m);
crit = 100
k = 1

while (tol < crit) && (k < 100)
%while k < 4
    %iteratie over de rijen
    for i = 1:(m-1)
        %iteratie over de kolommen
        for j = (i+1):m
            a = A(i,i);             
            b = A(j,j);
            d = A(i,j);
            theta = (1/2)*atan((2*d)/(b-a));
            s = sin(theta);
            c = cos(theta);
            Jk = eye(m);
            Jk(i,i) = c;
            Jk(j,j) = c;
            Jk(i,j) = s;
            Jk(j,i) = -s;
            J = J*Jk;
            A = transpose(Jk)*A*Jk;
        end
    end
    %criterium berekenen
    maxdiag = 0;
    diagsum = 0;
    for i = 1:m
        a = A(i,i);
        diagsum = diagsum + a^2;
        if abs(a) > maxdiag
            maxdiag = abs(a);
        end
    end
    offdiagsum = sqrt(sumsqr(A) - diagsum);
    crit = abs(offdiagsum/maxdiag)
    k = k + 1
end
D = A;
V = J;
end


