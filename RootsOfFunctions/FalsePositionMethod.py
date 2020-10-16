import math as m
import numpy as np

def f(x):
    return m.exp(-x) - x

def FalsePosition(a, b):
    fa = f(a)
    fb = f(b)
    x = a - ((a - b) * fa) / (fa - fb)
    eps = np.finfo(float).eps
    while (abs(x - a)) > eps and (abs(b -x) > eps):
        fx = f(x)
        if fx * fa > 0:
            a = x
            fa = fx
        else:
            b = x
            fb = fx
        x = a - ((a - b) * fa) / (fa - fb)
    return x

print(FalsePosition(0,1))
