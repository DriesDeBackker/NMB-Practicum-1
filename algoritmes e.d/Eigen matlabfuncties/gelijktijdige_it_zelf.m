function [V,D,res] = gelijktijdige_it(A,Q,maxit)

% function e = gelijktijdige_it(A,Q)
%
% gelijktijdige iteratie, berekent 1 eigenwaarde van A
%
% invoer:
% A     - matrix nxn
% Q     - matrix nxm, onafhankelijke kolommen
% maxit - maximum aantal iteraties
%
% uitvoer
% D - diagonaalmatrix met de berekende eigenwaarden van A
% V - eigenvectoren horend bij de eigenwaarden in D

[n,p] = size(A);
if n~=p,
  disp('A is geen vierkante matrix')
  return
end
if n<2
  disp('A moet minstens dimensie 2 hebben')
  return
end

n2 = size(Q,1);
if(n2 ~= n)
    disp(' Q moet evenveel rijen hebben als A' );
    return
end

Q = orth(Q); % Q moet orthonormaal zijn
res = [];
D = Q'*A*Q;

for it = 1:maxit
    Z = A*Q;
    [Q,R] = qr(Z,0);
    D2 = Q'*A*Q;
    res = [res abs(D(n,n) - (D2(n,n)))];
    D = Q'*A*Q;
    
end
res = [res abs(D(n,n) - (D(n,n)))];
D = Q'*A*Q;
V = Q;