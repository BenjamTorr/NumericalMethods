newt_fun = inline("x - (x - exp(-x)) / (1 + exp(-x))");
x_k = 1;
x_k1 = 10;
dif = 100;
n = 0;

while dif > eps
    x_k1 = newt_fun(x_k);
    x_k = x_k1;
    n = n + 1;
    dif = abs(x_k - newt_fun(x_k));
end

n, x_k
