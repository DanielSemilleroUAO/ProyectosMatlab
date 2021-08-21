clear all;
%Codigo estudiante: 2136332
armonicos = input('Ingresa la cantidad de armonicos: ')
%%Generacion de señal y Serie Fourier
clc;
A=21; %digitos 1 y 2 del codigo de estudiante
Tf=36; %digitos 3 y 4 del codigo de estudiante
Fs1=332; %digitos 5, 6 y 7 del codigo de estudiante
F=1/Tf ;
w=2*pi*F;
t=0:1/(Fs1*10):2*Tf;
ft=zeros(1, length(t));
senal_temp=0;
for n = 1:armonicos*2 %Se multiplica por dos para tomar los picos impares
  if mod(n,2) ~= 0 %Para impares
    senal_temp = senal_temp + 4*A/(n*pi).*sin(n*w.*t); %Acumlacion de la senal
  end
end
Senal = senal_temp;
%f(t) = 4*A/(pi*n).*sin(n*w.*t) para n impares
%Senal=4*A/pi.*sin(1*w.*t)+4*A/(3*pi).*sin(3*w.*t)+4*A/(5*pi).*sin(5*w.*t)+4*A/(7*pi).*sin(7*w.*t)+4*A/(9*pi).*sin(9*w.*t);
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
