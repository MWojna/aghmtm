import numpy as np
import matplotlib.pyplot as plt

N = 1000
n = np.arange(N)

X = np.fft.fft(x)
k_max = np.argmax(np.abs(X[:N//2]))
k_n = k_max + 1 if np.abs(X[k_max+1]) > np.abs(X[k_max-1]) else k_max - 1

X1, X2 = X[k_max], X[k_n]
wk1, wk2 = 2 * np.pi * k_max / N, 2 * np.pi * k_n / N
lamb = (X1 - X2) / (X1 * np.exp(-1j * wk1) - X2 * np.exp(-1j * wk2))
dE = -np.real(np.log(lamb))

AE = (1 - lamb * np.exp(-1j * wk1)) / (1 - lamb**N)
phiE = 2 * X1 * AE

x = AE * np.cos(wE * n + phiE) * np.exp(-dE * n)

A, d, phi = 1.5, 0.001, 0.3
w1 = 2 * np.pi / N *(10 - 0.4)
x1 = A * np.cos(w1 * n + phi) * np.exp(-d * n)

w2 = 2 * np.pi / N *(10 + 0.4)
x2 = A * np.cos(w2 * n + phi) * np.exp(-d * n)

plt.figure(figsize=(12, 6))

plt.subplot(2, 1, 1)
plt.plot(n, x1, 'b')
plt.grid(True)
plt.legend()

plt.subplot(2, 1, 2)
plt.plot(n, x2, 'r')
plt.xlabel("Sample index (n)")
plt.grid(True)
plt.legend()

plt.tight_layout()
plt.show()