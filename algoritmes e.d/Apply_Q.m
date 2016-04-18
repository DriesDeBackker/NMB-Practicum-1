function y = Apply_Q(L,b)
s = size(L);
m = s(1);
n = s(2);
disp('Dit is de matrix L die we gebruiken');
disp(L);
%disp('Dit is de vector b waarop gerekend wordt');
%disp(b);
%disp('-----------------------------------------');
y = b;
for k = 1:n
    vk = L(k:m,k);
    disp('Dit is de vector vk');
    disp(vk);
    y(k:m) = y(k:m) - 2*vk*(ctranspose(vk)*y(k:m));
    disp('Dit is de voorlopige vector y = Q*.b');
    disp(y);
    disp('-------------------------------------------');
end