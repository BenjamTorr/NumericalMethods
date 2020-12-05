f1 = inline('2 * sin(x .* x)');
f2 = inline('2 * cos(x .* x)');
n = 100;
h = 1 / n;
range = 0 : h : 1;

fresint1 = sum(f1(range));
fresint1 = fresint1 - (0.5 * f1(0) + 0.5 * f1(1));
fresint1 = h * ( fresint1);

fresint2 = sum(f2(range));
fresint2 = fresint2 - (0.5 * f2(0) + 0.5 * f2(1));
fresint2 = h * ( fresint2);

fresint1, fresint2