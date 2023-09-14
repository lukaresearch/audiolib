function y = TensComplement(x,N)
%
% y = TensComplement(x,N)
% --------------
% Decimal equivalent of 
%  Sign-Magnitude format integer to N-digit 10's-Complement format conversion
%
%    x: integer between -10^N/2 <= x <  10^N/2  (sign-magnitude)
%    y: integer between       0 <= y <= 10^N-1  (10's-complement)

n = 10^N;
if any((x < -n/2) | (x >= n/2)) 
    error('Numbers must satisfy -10^N/2 <= x <  10^N/2')
end

s = sign(x);  % sign of x (-1 if x<0, 0 if x=0, 1 if x>0)
sb = (s < 0); % sign-bit  (0 if x>=0, 1 if x<0));
y = (1-sb).*x + sb.*(n+x);