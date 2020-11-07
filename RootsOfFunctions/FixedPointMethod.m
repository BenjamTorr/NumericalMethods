
%Para la funcion original
exp_fun = inline("exp(-x)");
x_k = 1;
x_k1 = 0;
dif = 100;
n = 0;
while dif > eps
    x_k1 = exp_fun(x_k);
    x_k = x_k1;
    dif = abs(x_k - exp_fun(x_k));
    n = n + 1;
end

display("El punto fijo es:");
display(x_k1);
display(n);

%Para la funcion equivalente.
w_0 = 1 / 0.5671;
g = inline('(w * exp(-x) + x) / (1 + w)', 'x', 'w');
dif2 = 100;
n2 = 0;
x2_k = 1;
x2_k1 = 0;
while dif2 > eps
    x2_k1 = g(x2_k, w_0);
    x2_k = x2_k1;
    dif2 = abs(x2_k - g(x2_k,w_0));
    n2 = n2 + 1;
end

n2
