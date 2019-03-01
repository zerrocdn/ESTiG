import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

def func(x, w0, w1, w2, w3):
    return w0 + w1 * x + w2 * x**2 + w3 * x**3

x = np.linspace(-2, 20, 50)
y = func(x, 2, 4, 0, 0)

yn = y + 10 * np.random.normal(size = len(x))

popt, pcov= curve_fit(func, x, yn)

print(popt)

plt.plot(x, yn, ".")
plt.plot(x, y, "b")
plt.plot(x, func(x, popt[0], popt[1], popt[2], popt[3]), "r")