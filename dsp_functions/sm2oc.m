function y = sm2oc(x,B)
%
% y = sm2oc(x,B)
% --------------
%   Decimal equivalent of Sign-Magnitude format to 
%   One's-Complement format conversion for a B-bit number x
%
%    x: fraction between -1 < x < 1 (sign-magnitude)
%    y: fraction between  0 < y < 2 (1's-complement)

x = fix(x*2^B)/(2^B);
s = sign(x); sb = -s > 0; 
y = (1-sb).*x + sb.*(2+x-2^(-B));