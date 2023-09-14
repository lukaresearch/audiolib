function [xccs, xcca] = circevod(x)
% Complex-valued signal decomposition into circular-even and circular-odd parts
% -----------------------------------------------------------------------------
% [xccs, xcca] = circecod(x)
%

N = length(x); n = 0:(N-1);
xccs = 0.5*(x + conj(x(mod(-n,N)+1)));
xcca = 0.5*(x - conj(x(mod(-n,N)+1)));
