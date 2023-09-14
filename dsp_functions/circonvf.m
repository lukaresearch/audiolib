function y = circonvf(x1,x2,N)
%
%function y=circonvf(x1,x2,N)
%
% N-point circular convolution between x1 and x2: (freq domain)
% -------------------------------------------------------------
% y : output sequence containing the circular convolution
% x1 : input sequence of length N1 \TEXTsymbol{<}= N
% x2 : input sequence of length N2 \TEXTsymbol{<}= N
% N : size of circular buffer
%
% Method: y(n) = idft(dft(x1)*dft(x2))
% Check for length of x1

if length(x1) > N
error('N must be >= the length of x1')
end

% Check for length of x2
if length(x2) > N
error('N must be >= the length of x2')
end

x1 = [x1 zeros(1,N-length(x1))]; x2 = [x2 zeros(1,N-length(x2))];
X1 = fft(x1); X2 = fft(x2); y = (ifft(X1.*X2));