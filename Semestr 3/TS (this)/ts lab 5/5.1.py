import numpy as np
import matplotlib.pyplot as plt

A = 1
phi = 0
n = np.arange(0, 50)

omega_0 = np.pi / 4
x1 = A * np.cos(omega_0 * n + phi)

x2 = A * np.cos((omega_0 + 2 * np.pi) * n + phi)

F_s = 100
F_0 = 10
x3 = A * np.cos(2 * np.pi * F_0 / F_s * n + phi)

x4 = np.zeros(len(n))
x4[0] = 1
x4[1] = np.cos(omega_0)
for i in range(2, len(n)):
    x4[i] = 2 * np.cos(omega_0) * x4[i - 1] - x4[i - 2]

fig, axs = plt.subplots(2, 2, figsize=(12, 8))

axs[0, 0].stem(n, x1, basefmt=" ")

axs[0, 1].stem(n, x2, basefmt=" ")

axs[1, 0].stem(n, x3, basefmt=" ")

axs[1, 1].stem(n, x4, basefmt=" ")

for ax in axs.flat:
    ax.set_xlabel('n')
    ax.set_ylabel('x[n]')
    ax.grid(True)

plt.tight_layout()
plt.show()