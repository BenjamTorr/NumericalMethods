function spline = ReturnSpline(XY)
    X = XY(:,1);
    Y = XY(:,2);
    sz = size(X);
    l = sz(1);
    b = zeros(l, 1);
    h = zeros(l, 1);
    u = zeros(l, 1);
    v = zeros(l, 1);
    z = zeros(l, 1);
    spline = zeros(l - 1, 4);

    for i = 1 : (l - 1),
        h(i) = X(i+1) - X(i);
        b(i) = (Y(i+1) - Y(i)) / (X(i + 1) - X(i));
    end

    u(2) = 2*(h(i - 1) + h(i));
    for i = 3: (l - 1),
        u(i) = 2*(h(i - 1) + h(i)) - (h(i-1) * h(i-1)) / u(i-1);
    end
    
    v(2) = 6*(b(2) - b(1));
    
    for i = 3: (l - 1),
        v(i) = 6*(b(i) - b(i - 1)) - (h(i - 1) * v(i-1)) / u(i - 1);
    end
    z(l) = 0;
    for i = l - 1 : -1 : 2,
        z(i) = v(i) / u(i) - h(i) * z(i+1) / u(i);
    end
    for i = 1 : (l - 1),
        dx = X(i+1) - X(i);
        spline(i, 1) = z(i + 1) / (6 * dx);
        spline(i, 2) = (Y(i+1) / dx) - (z(i + 1) * dx) / 6;
        spline(i, 3) = z(i) / ( 6 * dx);
        spline(i, 4) = (Y(i) / dx - (z(i) * dx) / 6);
    end
end

