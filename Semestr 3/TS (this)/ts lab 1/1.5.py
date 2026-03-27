import numpy as np
import matplotlib.pyplot as plt

C = 1
a = -0.1
Omega0 = 5
fi = 1
t = np.linspace(-10, 10, 400)

x = C * np.exp(a * t) * np.cos(Omega0 * t + fi)
y = C * np.exp(a * t)

plt.figure(figsize=(8, 4))
plt.plot(t, x, label='C * np.exp(a * t) * np.cos(Omega0 * t + fi)')
plt.plot(t, y, label='C * np.exp(a * t)')
plt.title('Damped sinusoidal signal ')
plt.xlabel('Time (t)')
plt.ylabel('x(t)')
plt.grid(True)
plt.legend()
plt.show()