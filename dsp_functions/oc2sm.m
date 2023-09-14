function x = oc2sm(y,B)
%
% x = oc2sm(y,B)
% --------------
%   Decimal equivalent of One's-Complement format to 
%   Sign-Magnitude format conversion for a B-bit number x
%
%    x: fraction between -1 < x < 1 (sign-magnitude)
%    y: fraction between  0 < y < 2 (1's-complement)
%

x = y-1;
s = sign(x); sb = -s > 0; 
x = (1-sb).*(x-1+2^(-B)) + sb.*(1+x);