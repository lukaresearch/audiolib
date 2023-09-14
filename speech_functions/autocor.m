function R = autocor(L, s, p)

R = zeros(p+1, 1);
for k=0:p
    m=1:(L-k);
    R(k+1) = s(m)' * s(m+k);
end