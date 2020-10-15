function biseccion(a,b,ntol)
    f = inline('x*x*x -x +1');
    for n = 1: ntol
        x = a + (b - a)/2;
        if f(x) * f(b) < 0
            a = x;
        else
            b = x;
        end
    end
    disp(x);
end
