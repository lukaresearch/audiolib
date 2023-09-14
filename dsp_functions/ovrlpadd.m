function [y] = ovrlpadd(x,h,N)
% Overlap-Add method of block convolution
% ----------------------------------------
% [y] = ovrlpadd(x,h,N)
% y = output sequence
% x = input sequence
% h = impulse response
% N = DFT length >= 2*length(h)-1
%
Lx = length(x); L = length(h); L1 = L-1;
h = [h zeros(1,N-L)];
%
M = ceil(Lx/L);           % Number of blocks
x = [x, zeros(1,M*L-Lx)]; % append (M*N-Lx) zeros
Y = zeros(M,N);           % Initialize Y matrix
%
% convolution with succesive blocks
for m = 0:M-1
	xm = [x(m*L+1:(m+1)*L),zeros(1,N-L)];
	Y(m+1,:) = circonvt(xm,h,N);
end
%
% Overlap and Add
Y = [Y,zeros(M,1)]; Y = [Y;zeros(1,N+1)];
Y1 = Y(:,1:L); Y1 = Y1'; y1 = Y1(:);
Y2 = [zeros(1,L);Y(1:M,L+1:2*L)]; Y2 = Y2'; y2 = Y2(:);
y = y1+y2; y = y'; y = removetrailzeros(y);