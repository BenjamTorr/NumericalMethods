function x = FalsePosition(a, b, tol)
    f = inline('exp(-x)-x');
    fa = f(a);
    fb = f(b);
    x = a - ((a - b)*fa)/ (fa - fb);
    while(abs(x - a) > tol && abs(b -x) > tol)
        fx = f(x);
        if fx * fa > 0
            a = x;
            fa = fx;
        else
            b = x;
            fb = fx;
        end
        x = a - ((a - b)*fa)/ (fa - fb);
    end
end