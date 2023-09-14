function [x,n] = impseq(n0,n1,n2)
% Generates x(n) = delta(n-n0); n1 <= n <= n2
% -------------------------------------------
% [x,n] = impseq(n0,n1,n2)
%
n = [n1:n2];
x = [(n-n0) == 0];

% Hf_1 = figure('papaerunits','inches','paperposition',[0,0,5,2]);

%     print -deps2 p0201a.eps;
% for color -depsc2

% Hs = stem(n,x,'filled');

% set(Hs,'markersize',2);