A = sprand(1000,1000,0.3);
E = real(eigs(A));          
[n,m] = size(E);
b = rand(1000,1);
residu = [];
k=100;
C = cell(k+1, k);
for i=1:k
    [H,Q] = arnoldi(A,b,i);
    Hn = Q'*A*Q;
    En = real(eig(Hn)); %enkel reele delen
    
    [d,e] = size(En);
    for j=1:d
        C{j,i} = En(j);
    end        
end
for i=3:k+1             %kolommen vullen met 0'en
    for j=1:k
        if(i>j+1)
            C{i,j} = 0;
        end
    end
end

M = cell(n,1);
for i=1:n
    M{i} = ones(1,k)*E(i);
end

x=1:k;
pl = newplotlist();


for i=1:n
    pl = addplotlist(pl,'Eigenvalue',x,log(M{i}),'k');
end
for i=1:k+1
    pl = addplotlist(pl,'Arnoldi',x,log([C{i,:}]),'b');
end

doplotlist(pl,'plot')