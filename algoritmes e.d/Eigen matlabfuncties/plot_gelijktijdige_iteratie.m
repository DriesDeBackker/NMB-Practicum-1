clear;
load mat1.txt
[Q,R] = qr(mat1);
[V,D,res] = gelijktijdige_it(mat1,Q,30);

plot(log10(res))

title('Convergentie van gelijktijdige iteratie');
xlabel('Iteraties');
ylabel('log10(Norm van residu)');