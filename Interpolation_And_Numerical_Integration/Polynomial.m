XY = load("datos.txt");
X = XY(:,1);
Y = XY(:,2);
sz = size(X);
v1 = zeros(sz(1), 1);
v2 = zeros(sz(1), 1);
v1(:) = Y(:);
poliOptimizado = zeros(sz(1), 1);
poliOptimizado(1) = Y(1);
poliOptimizado;
for j = 2: sz(1),
    for i = j : sz(1),
        v2(i) = v1(i) - v1(i-1);
        v2(i) = v2(i) / (X(i) - X(i - j + 1));
    end
    v1 = v2;
    poliOptimizado(j) = v2(j);
end
range = 0.9:0.1:13.3;
graph2 = EvaluaPoli(poliOptimizado, X, range);
plot(range, graph2, X, Y)
