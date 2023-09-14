function x2 = circfold(x1,N)
% Circular folding with respect to N
% ----------------------------------
% function x2 = circfold(x1,N)
%          x2(n) = x1((-n) mod N)
%
x2 = dft(dft(x1,N),N)/N;