m = 100;
alpha = 1;
A = sprand(m,m,0.5);
A = A + alpha*(speye(m)); A=A/norm(A,1);
b = rand(m,1);
exacte_opl = A\b;

n = 12;

[x,itx,res] = NMB_gmres(A,b,n);

itx_verschil_exact = [];
fout_matrix = [];

for i= 1:n
    d = abs(itx(:,i) - exacte_opl);
    itx_verschil_exact = [itx_verschil_exact d];
    fout_matrix = [fout_matrix norm(d)];
end

pl = newplotlist
v =1:n;
y = res/norm(b);
pl = addplotlist(pl, 'Rayleigh Iteratie', v, log(y), 'g');

doplotlist(pl, 'plot');