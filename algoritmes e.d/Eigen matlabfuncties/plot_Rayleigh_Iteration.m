clear;

load mat1.txt
H = hess(mat1);
v = ones(35,1);
[lambda,v,res] = rayleigh(H, v, 20);

pl = newplotlist
x = 1:30
y = res
plot(log10(res))

title('Convergentie van Rayleigh Quotient Iteration');
xlabel('Iteraties');
ylabel('log10(Norm van residu)');

[e,res] = qr_shiftrayleigh(mat1);

[Q,R] = qr(mat1);
[V,D,res] = gelijktijdige_it(mat1,Q,30);
