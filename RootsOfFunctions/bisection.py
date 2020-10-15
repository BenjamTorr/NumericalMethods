def f(x):
    return x ** 3 - x + 1

def bisection(a, b, ntol):
    for n in range(0,ntol):
        x = a + (b - a) / 2
        if f(x) * f(b) < 0:
            a = x
        else:
            b = x
    return x

print(bisection(-5, 0, 10))
