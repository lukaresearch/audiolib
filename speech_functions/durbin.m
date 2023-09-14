function  [G, a] = durbin(p, R)

E = R(1);
a1 = zeros(p,1);
a = zeros(p,1);
for i=1:p
    ar = 0;
    for j=1:(i-1)
        ar = ar + a1(j)*R(i-j+1);
    end
    k = (R(i+1) - ar)/E;
    
    a(i) = k; % i-th
    for j=1:(i-1) % 1~(i-1)
        a(j) = a1(j) - k*a1(i-j);
    end
    E = (1-k*k)*E;
    a1 = a;
end

%a = inv(toeplitz(R(1:p))) * R(2:(p+1));
G = sqrt(R(1) - a' * R(2:(p+1)));