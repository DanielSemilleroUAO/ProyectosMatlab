%% Diagrama de Bode
%Magnitud
w = -0.5:0.001:0.5;
mag = 4921.25*((1/1828.795*pi)./sqrt(((w./6.283).^2)+(1/1828.795*pi)^2));
subplot(2,1,1);
plot(w,mag);
title("Magnitud");
xlabel("Hz");
ylabel("mag");
%Fase
w = -0.5:0.001:0.5;
phase = -atan((w/6.283)/((1/1828.795*pi)))*180/pi;
subplot(2,1,2);
plot(w,phase);
title("Fase");
xlabel("Hz");
ylabel("fase");

%% Gráfica de la Salida
a = 2.8316e-3;
b = 0.02;
r = 4921.25;
c = 0.371612*pi;
t= 0:1:10*r*c;
A = r*c;
B = (((1/r*c)^2)-(b/r*c)+(b^2))/((-1/r*c)*(((1/r*c)^2)+(b^2)));
C = -(A + B);
D = 1-((1/r*c)*(A+C));
h = (a/c)*(A+(B.*exp((-1/r*c).*t))+(C.*cos(b.*t))+((D/b).*(sin(b.*t))));
figure(2);
plot(t,h);
title("Gráfica de la altura del tanque en metros");
xlabel("t(s)");
ylabel("altura(m)");


