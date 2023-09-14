function [D] = bin2sm(B)
% Binary Representation to Sign-Magnitude format 
% ----------------------------------------------
% [D] = sm2bin(B)
% B = Binary code representation ('char')
% D = Decimal integer 
%

B = num2str(B); sb = str2num(B(1)); B = B(2:end);
D = bin2dec(B)*(1-2*sb);