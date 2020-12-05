function f = EvalSpline(Spline, k , X, x)
    f = Spline(k,1) .* (x - X(k)).^ 3;
    f = f + Spline(k,2) .* (x - X(k));
    f = f + Spline(k, 3) .* (X(k+1) - x).^3;
    f = f + Spline(k, 4) .* (X(k+1) - x);
end

