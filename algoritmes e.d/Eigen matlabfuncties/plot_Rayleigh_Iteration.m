clear;
load mat1.txt
H = hess(mat1);
[lambda,v,resRay] = rayleigh(H, transpose(H(1:35)), 20);


plot(log10(resRay))

title('Convergentie van Rayleigh Quotient Iteration');
xlabel('Iteraties');
ylabel('log10(Norm van residu)');