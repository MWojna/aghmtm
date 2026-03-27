import numpy as np
import matplotlib.pyplot as plt

x = np.array([1, 2, 3, 4])
h = np.array([1, 0.5, 0, -0.5, -1, -1.5, -2, -2.5, -3])

N = len(x)
M = len(h)
y_manual = np.zeros(N + M - 1)

for n in range(len(y_manual)):
    for k in range(N):
        if 0 <= n - k < M:
            y_manual[n] += x[k] * h[n - k]

y_numpy = np.convolve(x, h)

plt.figure(figsize=(10, 4))
plt.stem(range(len(y_manual)), y_manual, linefmt='b-', markerfmt='bo', basefmt=' ', label='Ręczna konwolucja')
plt.stem(range(len(y_numpy)), y_numpy, linefmt='r--', markerfmt='ro', basefmt=' ', label='np.convolve()')
plt.title('Porównanie konwolucji: ręczna vs numpy')
plt.xlabel('n')
plt.ylabel('y[n]')
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()