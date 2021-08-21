fs = 2126;               % sampling frequency
Fo = 224;
t = 0:(1/fs):(200 - 1/fs); % time vector
S = 5*cos(2*pi*Fo*t) + 3*sin(2*pi*2*Fo*t)- 2*sin(2*pi*3*Fo*t) + 0.5;
subplot(2,1,1)
t1 = 0:(1/fs):200*(1/fs); % time vector
S1 = 5*cos(2*pi*Fo*t1) + 3*sin(2*pi*2*Fo*t1)- 2*sin(2*pi*3*Fo*t1) + 0.5;
stem(t1,S1)
%%
n = length(S);
X = fft(S);
f = (0:n-1)*(fs/n);     %frequency range
%%
Y = fftshift(X);
fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
powershift = (abs(Y).^2)/n;     % zero-centered power
subplot(2,1,2)
stem(fshift,powershift)
Potencia_total = sum(powershift)
