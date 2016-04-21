clear;

load mat1.txt
H = hess(mat1);
v = ones(35,1);
[lambda,v,res] = rayleigh(H, v, 29);

pl = newplotlist
x = 1:30
y = res
pl = addplotlist(pl, 'Rayleigh Iteratie', x, log10(y), 'g');

% title('Convergentie van Rayleigh Quotient Iteration');
% xlabel('Iteraties');
% ylabel('log10(Norm van residu)');

[e,res] = qr_shiftrayleigh(mat1);
x=1:3
y = res;
pl = addplotlist(pl, 'QR met Rayleigh Quotiënt Shift', x, log10(y), 'b');

[Q,R] = qr(mat1);
[V,D,res] = gelijktijdige_it(mat1,Q,30);
x=1:31
y = res;
pl = addplotlist(pl, 'gelijktijdige iteratie', x, log10(y), 'r');


doplotlist(pl, 'plot');

