tao = 10
t = -tao/2:0.001:ta0/2
x = ones()

t=0:Ts:(length(x)-1)*Ts;

plot(t,x); title('señal');xlabel('tiempo [seg]');
%%%%%%%%%%%%%%

esp = fft(x);
fftshift(esp);


figure
subplot(2,1,1); plot(ejef,real(esp)); title('esp real'); xlabel('frecuencia');
subplot(2,1,2); plot(ejef,imag(esp));  title('esp imaginario'); xlabel('frecuencioa');

figure
subplot(2,1,1); plot(ejef,abs(esp)); title('esp real'); xlabel('frecuencia');
subplot(2,1,2); plot(ejef,angle(esp));  title('esp imaginario'); xlabel('frecuencioa');
figure
psd = abs(esp).^2;
plot(ejef,psd); title("dencidad espectral de potencia");