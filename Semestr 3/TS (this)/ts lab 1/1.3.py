import numpy as np
import matplotlib.pyplot as plt

A = 1
Omega0 = 1
fi = 1
F0 = 0.16
t = np.linspace(-10, 10, 400)

x = A * np.cos(Omega0 * t + fi)
y = A * np.cos(2 * np.pi * F0 * t + fi)

plt.figure(figsize=(8, 4))
plt.plot(t, x)
plt.plot(t, y)
plt.title('Sinusoidal signal')
plt.xlabel('Time (t)')
plt.ylabel('x(t)')
plt.grid(True)
plt.show()