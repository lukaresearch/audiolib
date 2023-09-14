function y = sm2tc(x,B)
%
% y = sm2tc(x,B)
% --------------
%   Decimal equivalent of Sign-Magnitude format to 
%   Two's-Complement format conversion
%
%    x: fraction between -1 < x < 1 (sign-magnitude)
%    y: fraction between  0 < y < 2 (2's-complement)

s = sign(x); % sign of x (-1 if x<0, 0 if x=0, 1 if x>0)
sb = -s > 0; % sign-bit (0 if x>=0, 1 if x<0));
y = (1-sb).*x + sb.*(2+x);