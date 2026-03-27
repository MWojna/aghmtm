import numpy as np
import matplotlib.pyplot as plt

A = 1
phi = 0
omega_0 = np.pi / 10
d = 0.05
n = np.arange(0, 100)

x_direct = A * np.cos(omega_0 * n + phi) * np.exp(-d * n)

x_rec = np.zeros(len(n))
x_rec[0] = A * np.cos(phi) * np.exp(0)
x_rec[1] = A * np.cos(omega_0 + phi) * np.exp(-d * 1)
for i in range(2, len(n)):
    x_rec[i] = 2 * np.cos(omega_0) * np.exp(-d) * x_rec[i - 1] - np.exp(-2 * d) * x_rec[i - 2]

plt.figure(figsize=(10, 5))
plt.plot(n, x_direct, linewidth=2)
plt.plot(n, x_rec, '--', linewidth=2)
plt.xlabel('n')
plt.ylabel('x[n]')
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()