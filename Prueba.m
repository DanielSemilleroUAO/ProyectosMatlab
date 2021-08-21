syms t s;
T = 2*pi;
Phi = pi;
x = sin(((2*pi)/T)*t + Phi);
X = laplace(x)
[symNum,symDen] = numden(X); %Get num and den of Symbolic TF
TFnum = sym2poly(symNum);    %Convert Symbolic num to polynomial
TFden = sym2poly(symDen);    %Convert Symbolic den to polynomial
X = tf(TFnum,TFden);
H = tf(1,[1 2 1]);
Y = H*X

num = poly2sym(Y.Numerator, s)
den = poly2sym(Y.Denominator, s)
Ft = num/den
f(t) = ilaplace(num/den)
figure
fplot(f, [0,10])
grid