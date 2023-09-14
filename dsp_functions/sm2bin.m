function [B] = sm2bin(D)
% Sign-Magnitude format to Binary Representation
% ----------------------------------------------
% [B] = sm2bin(D)
% D = Decimal integer 
% B = Binary code representation ('char')
%

D = fix(D(:));
sb = floor((1 - sign(D))/2); % Sign-bit
B = [num2str(sb),dec2bin(abs(D))];