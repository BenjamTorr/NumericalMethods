function [f] = EvaluaPoli(coef, X,  x)
    sz = size(coef);
    y = 1 .* coef(1);
    for i=2: sz(1),
        z = 1 .* coef(i);
        for j = 1 : (i-1),
            z = z .* (x - X(j));
        end
        y = y + z;
    end
    f = y;
end

