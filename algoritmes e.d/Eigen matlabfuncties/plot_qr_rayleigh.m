clear;
load mat1.txt
H = hess(mat1);
[e,res] = qr_shiftrayleigh(mat1);

plot(log10(res))

title('Convergentie van QR met Rayleigh shift');
xlabel('Iteraties');
ylabel('log10(Norm van residu)');