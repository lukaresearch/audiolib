function [y] = hsolpadd(x,h)
% High-Speed Overlap-Add method of block convolution
% --------------------------------------------------
% [y] = hsolpadd(x,h)
% y = output sequence (real-valued)
% x = input sequence (real-valued)
% h = impulse response (real-valued)
%

Lx = length(x); L = length(h); N = 2^ceil(log2(2*L-1));
H = fft(h,N);
%
M = ceil(Lx/L);           % Number of blocks
x = [x, zeros(1,M*L-Lx)]; % append (M*N-Lx) zeros
Y = zeros(M,N);           % Initialize Y matrix
%
% convolution with succesive blocks
for m = 0:M-1
	xm = [x(m*L+1:(m+1)*L),zeros(1,N-L)];
	Y(m+1,:) = real(ifft(fft(xm,N).*H,N));
end
%
% Overlap and Add
Y = [Y,zeros(M,1)]; Y = [Y;zeros(1,N+1)];
Y1 = Y(:,1:L); Y1 = Y1'; y1 = Y1(:);
Y2 = [zeros(1,L);Y(1:M,L+1:2*L)]; Y2 = Y2'; y2 = Y2(:);
y = y1+y2; y = y'; y = removetrailzeros(y);