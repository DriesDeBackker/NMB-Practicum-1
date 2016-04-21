function y = Apply_Q(L,b)
s = size(L);
m = s(1);
n = s(2);
y = b;
for k = 1:n
    vk = L(k:m,k);
    y(k:m) = y(k:m) - 2*vk*(ctranspose(vk)*y(k:m));
end