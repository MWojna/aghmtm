import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import lfilter

b = np.array([0.5, -0.5])
d = np.array([1.0, -0.8])

x = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

N = len(d) - 1
M = len(b) - 1
y_manual = np.zeros(len(x))

#b, a = signal.elip(4,3,40,0.5)

for n in range(len(x)):
    for m in range(M + 1):
        if n - m >= 0:
            y_manual[n] += (b[m] / d[0]) * x[n - m]
    for k in range(1, N + 1):
        if n - k >= 0:
            y_manual[n] -= (d[k] / d[0]) * y_manual[n - k]

y_lfilter = lfilter(b, d, x)

plt.figure(figsize=(10, 4))
plt.plot(y_manual, 'bo-')
plt.plot(y_lfilter, 'r--')
plt.xlabel('n')
plt.ylabel('y[n]')
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()