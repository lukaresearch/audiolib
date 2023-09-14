function x = tc2sm(y,B)
%
% x = tc2sm(y,B)
% --------------
%   Decimal equivalent of Two's-Complement format to 
%   Sign-Magnitude format conversion
%
%    y: interger between 0 < y < 2 (2's-complement)
%    x: integer between -1 < x < 1 (sign-magnitude)

x = y-1;
s = sign(x); sb = -s > 0; 
x = (1-sb).*(x-1) + sb.*(1+x);