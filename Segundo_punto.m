%%Generacion de señal y Serie Fourier
%Codigo estudiante: 2136332
clear all;
armonicos = input('Ingresa la cantidad de armonicos: ')
clc;
A=21; %digitos 1 y 2 del codigo de estudiante
Tf=36; %digitos 3 y 4 del codigo de estudiante
Fs1=332; %digitos 5, 6 y 7 del codigo de estudiante
F=1/Tf ;
w=2*pi*F;
t=0:1/(Fs1*10):2*Tf;
ft=zeros(1, length(t));
senal_temp=0;
for n = 1:armonicos
   senal_temp = senal_temp + A/(n*pi).*sin(n*w.*t);
end
Senal = A/2 + senal_temp;
subplot(2,1,1);
plot(t, Senal);
title(strcat('Señal F(t)armonicos=',int2str(armonicos)));
xlabel('tiempo (s)') 
ylabel('F(t)')
dft=fft(Senal); %Analisis Fourier
dftabs=abs(dft/length(t));
lf=floor(length(t)/2);
dftabs=dftabs(1:lf+1);
dftabs(2:end-1)=2*dftabs(2:end-1);
f = Fs1*10*(0:lf)/length(t);
subplot(2,1,2);
stem(f(1:100), dftabs(1:100)); %Espectro de la señal
title(strcat('Espectro de la señal con armonicos=',int2str(armonicos)));
xlabel('frecuencia (kHz)') 
ylabel('|S(f)|')