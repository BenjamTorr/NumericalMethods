XY1 = load('datos.txt');
XY2 = load('Perfil_inf.txt');
X1 = XY1(:,1);
sz = size(X1);
l = sz(1);
spline = ReturnSpline(XY1);
spline2 = ReturnSpline(XY2);
title('Spline')
hold on
for i = 1:(l-1),
    range = X1(i) : 0.1 : X1(i + 1);
    graph = EvalSpline(spline, i, X1, range);
    graph2 = EvalSpline(spline2, i, X1, range);
    plot(range, graph)
    plot(range, graph2)
end
hold off