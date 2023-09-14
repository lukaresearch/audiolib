function [cout] = LPC_cepstrum(fname)

p = 25;
cLength = 35;
fac = 1.; 
StartPosition = 1;

%frameLength = 1000;
%sampleStride = 300;
%Nframe = 1;
Nfft = 1024;
Nfft2 = Nfft / 2;
%N1 = 1. / sqrt(Nfft);

%fname = 'D:\1-ML\speech_lab\recordings\0_jackson_40.wav'; % printing
%fname = 'LJ001-0044.wav';  % John
[x,fs] = audioread(fname);
xSize = size(x);
xLen = xSize(1)
info = audioinfo(fname)
frameLength = 300;
sampleStride = round(frameLength / 2);
Nframe = floor((xLen - frameLength)/sampleStride) + 1;
cout = zeros(cLength+1, Nframe);

Position1 = StartPosition;
Position2 = frameLength+Position1-1;
w = Hamming(frameLength);
x0 = 0:Nfft2-1;
x1 = x0 * (fs / Nfft);
x2 = x0 + 1;
%figure(1)
for n=1:Nframe
    xs = x(Position1:Position2) .* w;
    %figure(1), subplot(6,1,1), plot(xs)
    xs = xs - fac * [0; xs(1:frameLength-1)]; % radiation filter
    %figure(1), subplot(6,1,2), plot(xs)
    
    radFilter = fft([1; -fac; zeros(Nfft-2, 1)]);
    %figure(1)
% subplot(6,1,3), plot(log(abs(radFilter(1:Nfft2))))

    R = autocor(frameLength, xs, p);
    %[G0, a0] = lpc1(p, R);
    [G, a] = durbin(p, R);
    
    [c0, c] = cepstrumLPC(G, a, p, cLength);
    cout(:, n) = [c0; c];
%    S = abs(fft([xs; zeros(Nfft-frameLength, 1)]));
%    A = abs(G ./ (fft([1; -a; zeros(Nfft-p-2, 1)])));
    S = log(abs(fft([xs; zeros(Nfft-frameLength, 1)])));
    A = log(G)-log(abs(fft([1; -a; zeros(Nfft-p-2, 1)])));
    %figure(1), subplot(6,1,3), plot(x1, S(x2),'b', x1, A(x2),'r');
    
%    figure(1), subplot(3,1,3), stem(0:cLength, [c0; c], 'b'), ylim([-4 4]), ylabel('LPC cepstrum');
    %subplot(3,1,3), plot(0:cLength, [c0; c], 'b'), ylim([-5 5]), ylabel('LPC cepstrum');
    %figure, stem(0:cLength, [c0; c], 'b'), ylabel('LPC cepstrum');
    Position1 = Position1 + sampleStride;
    Position2 = Position2 + sampleStride;
end
cout = cout';
fprintf("\n[%s]  %d frames  (%d < %d <= %d)\n", fname, Nframe, Position2-sampleStride, xLen, Position2);

%xplay = x(1:xLen);
%figure(1), subplot(6,1,4), plot(xplay)
%sound(xplay, fs);