% P0316
function [H] = freqresp(b , a , w)
% Frequency response function from difference equation
% [H] = freqresp(b , a , w)
%  H  = frequency response array evaluated at w frequencies
%  b  = numerator coefficient array
%  a  = denominator coeeficient array (a(1) = 1)
%  w  = frequency location array

bsize = length(b);
m = [0 : bsize - 1];
num = zeros(size(w));

for numer_ind = 1 : length(b)
    num = num + b(numer_ind) * exp(-j * w *  m(numer_ind));
end


asize = length(a);
l = [0 : asize - 1];
den = zeros(size(w));

for den_ind = 1 : length(a)
    den = den + a(den_ind) * exp(-j * w * l(den_ind));
end

H = num ./ den;