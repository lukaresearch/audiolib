function [X1,X2] = real2dft(x1,x2,N)
% DFTs of two real sequences
% [X1,X2] = real2dft(x1,x2,N)
%  X1 = N-point DFT of x1
%  X2 = N-point DFT of x2
%  x1 = real-valued sequence of length <= N
%  x2 = real-valued sequence of length <= N
%   N = length of DFT
%
% Check for length of x1 and x2
if length(x1) > N
        error('*** N must be >= the length of x1 ***')
end
if length(x2) > N
        error('*** N must be >= the length of x2 ***')
end
N1 = length(x1); x1 = [x1 zeros(1,N-N1)];
N2 = length(x2); x2 = [x2 zeros(1,N-N2)];
x = x1 + j*x2;
X = dft(x,N);
[X1, X2] = circevod(X); X2 = X2/j;