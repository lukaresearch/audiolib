function [c0, c] = cepstrumLPC(G, a, p, cLength)

c0 = log(G);
c = zeros(cLength, 1);
for n=1:min(p, cLength)
    sumCA = 0;
    for k=1:(n-1)
        sumCA = sumCA + k*c(k)*a(n-k);
    end
    c(n) = a(n) + sumCA/n;
end

if(cLength > p)
    for n=(p+1):cLength
        sumCA = 0;
        for k=(n-p):(n-1)
            sumCA = sumCA + k*c(k)*a(n-k);
        end
        c(n) = sumCA/n;
    end
end