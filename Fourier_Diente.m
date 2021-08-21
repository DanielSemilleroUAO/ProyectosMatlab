%% Funcion de acuerdo a la función en intervalos
T = 224; 
A = 126;
TM = 0.001;
t1 = -T/4:TM:(T/4)-TM;
f1 = ((2*A)/T).*t1 + A/2;
t2 = T/4:TM:(3*T/4)-TM;
f2 = zeros(1,length(t2));
t = [t1 t2];
f = [f1 f2];

tl = -T/4:TM:(3*T/4-TM)+T;
fl = [f f];
plot(tl,fl,"--",'LineWidth',2)

%% Serie de Fourier
tf = -T/4:TM:(3*T/4-TM)+T;
ff = zeros(1,length(tf));
An=0;
Bn = 0;
for i = 1:length(tf)
    for j = 1:500
        if mod(j,2) == 1
            An = An + (A/pi)*(cos((j*2*pi*tf(i))/T))*(((-1)^((j-1)/2)))*(1/j);
            Bn = Bn + (sin((2*pi*j*tf(i))/T))*(2*A/((pi^2)))*((-1)^((j-1)/2))*(1/(j^2));
        else
            Bn = Bn + (sin((2*pi*j*tf(i))/T))*((-A/(pi*j))*((-1)^((j*(j-1))/2)));
        end
        
    end
    ff(i) =  (A/4) + An + Bn;
    An = 0;
    Bn = 0;
end

hold on
plot(tf,ff,'LineWidth',1)
grid on
xlabel("tiempo (ms)")
ylabel("Amplitud")
title("F(t)")