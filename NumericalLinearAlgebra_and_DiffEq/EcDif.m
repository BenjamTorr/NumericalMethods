%Torres Aguilar Ishmael Benjamin Asignacion Especial MN 2021.
%Soluciona La ecuacion diferencial y' =(t+2t**3)y**3-ty usando el metodo de
%Heun y RK cuarto orden.

f = inline('(t+2*t^3)*y^3-t*y','t','y');
x = 0:0.1:2;
h = 0.1;
l = size(x);
l = l(2);
yH = zeros(1,l); %%yH - y para Heun
yH(1) = 1/3;
yK = zeros(1,l);
yK(1) = 1/3; %%yK - para y Runge Kutta
for i=2:l,
    K1 = h * f(x(i-1),     yH(i-1));
    K2 = h * f(x(i-1) + h, yH(i-1) + K1);
    yH(i) = yH(i-1) + (1/2)*(K1 + K2);
end
hold on
plot(x,yH, 'r');
title('Solucion por el metodo de Heun')
pause(2)

for i=2:l,
    K1 = h * f(x(i-1),     yK(i-1));
    K2 = h * f(x(i-1)+h/2, yK(i-1)+K1/2);
    K3 = h * f(x(i-1)+h/2, yK(i-1)+K2/2);
    K4 = h * f(x(i-1)+h, yK(i-1)+K3);
    yK(i) = yK(i-1) + (1/6)*(K1 + 2*K2 + 2*K3 + K4);
end
plot(x,yK, 'g')
title('Solucion por el metodo R-K 4to orden')
pause(2)
ysol = inline('(3+2*t.^2+6*exp(t.^2)).^(-1/2)','t');
clf('reset')
plot(x,ysol(x), 'b')
title('Solucion Analitica del problema')
pause(2)
hold off
clf('reset')
hold on
plot(x,yH -ysol(x))
title('Error cometido por Heun')
pause(2)
clf('reset')
plot(x,yK -ysol(x))
title('Error cometido por R-k 4to Orden')
hold off