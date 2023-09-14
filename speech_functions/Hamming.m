function w = Hamming(L)

w = 0.54 - 0.46*cos(2*pi*(0:L-1)' / L);