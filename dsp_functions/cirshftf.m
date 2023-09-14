function y = cirshftf(x,m,N)
%  Circular shift of m samples wrt size N in sequence x: (freq domain)
%  -------------------------------------------------------------------
% function y=cirshift(x,m,N)
%       y : output sequence containing the circular shift
%       x : input sequence of length <= N
%       m : sample shift
%       N : size of circular buffer
%
%  Method: y(n) = idft(dft(x(n))*WN^(mk))
%
%   If m is a scalar then y is a sequence (row vector)
%   If m is a vector then y is a matrix, each row is a circular shift
%       in x corresponding to entries in vecor m
%   M and x should not be matrices
%
% Check whether m is scalar, vector, or matrix
[Rm,Cm] = size(m);
if Rm > Cm
    m = m'; % make sure that m is a row vector
end
[Rm,Cm] = size(m);
if Rm > 1
    error('*** m must be a vector ***') % stop if m is a matrix
end
% Check whether x is scalar, vector, or matrix
[Rx,Cx] = size(x);
if Rx > Cx
    x = x'; % make sure that x is a row vector
end
[Rx,Cx] = size(x);
if Rx > 1
    error('*** x must be a vector ***') % stop if x is a matrix
end
% Check for length of x
if length(x) > N
        error('N must be >= the length of x')
end
x=[x zeros(1,N-length(x))];
X=dft(x,N);
X=ones(Cm,1)*X;
WN=exp(-2*j*pi/N);
k=[0:1:N-1];
Y=(WN.^(m' * k)).*X;
y=(conj(dfs(conj(Y),N)))/N;