Fs = 2126;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Tiempo
Fo = 224;
% F1 = 224 F2 = 448 F3 = 672

f = 5*cos(2*pi*Fo*t) + 3*sin(2*pi*2*Fo*t)-2*sin(2*pi*3*Fo*t)+0.5;

Y = fft(f);
Y = fftshift(Y);

P2 = abs(Y).^2;
%P2 = abs(Y/L);
%P1 = P2(1:L/2+1);
%P1(2:end-1) = 2*P1(2:end-1);
%f=linspace(-0.5*Fs,0.5*Fs,length(P2));
n = length(f);
f = (-n/2:n/2-1)*(Fs/n);
%f = Fs*(0:(L/2))/L;
stem(f,P2) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')