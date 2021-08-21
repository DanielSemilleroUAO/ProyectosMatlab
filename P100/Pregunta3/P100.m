%% NOTA: Importar los datos del archivo antes de ejecutar el script
tiempo = DatosexperimentoPresion.t;
entrada = DatosexperimentoPresion.Voltaje_Valvula;
salida = DatosexperimentoPresion.Presion_Tanque;

%% Y(t) calculada con la gráfica
ycg = 0.016614 - 0.016614*exp(-55.09.*tiempo);
plot(tiempo, ycg)
hold on
plot(tiempo,salida)
xlabel("t(s)")
ylabel("Presion tanque")
title("Y(t) calculada con la gráfica")

%% Y(t) calculada con ident
figure(2)
yci = 0.016714 - 0.016714*exp(-31.11.*tiempo);
plot(tiempo, yci)
hold on
plot(tiempo,salida)
xlabel("t(s)")
ylabel("Presion tanque")
title("Y(t) calculada con Ident")

%% Calculo coeficiente determinación con calculada con la gráfica
yav = mean(salida);
s1 = sum((salida-yav).^2);
s2 = sum((salida-ycg).^2);
z = 1 - s2/s1;
z %Coeficiente determinacion

%% Calculo coeficiente determinación con calculada con ident
yav = mean(salida);
s1 = sum((salida-yav).^2);
s2 = sum((salida-yci).^2);
z = 1 - s2/s1;
z %Coeficiente determinacion