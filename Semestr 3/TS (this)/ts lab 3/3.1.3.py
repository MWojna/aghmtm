import numpy as np
import matplotlib.pyplot as plt

T0 = 2.0
T1 = 0.5
Omega0 = 2 * np.pi / T0
N = 25
t = np.linspace(-T0/2, T0/2, 1000)

def a_k(k):
    if k == 0:
        return 2 * T1 / T0
    else:
        return np.sin(k * Omega0 * T1) / (k * np.pi)

xN = np.zeros_like(t, dtype=np.complex128)
for k in range(-N, N+1):
    xN += a_k(k) * np.exp(1j * k * Omega0 * t)

xN_real = np.real(xN)

plt.figure(figsize=(10, 4))
plt.plot(t, xN_real, label=f'Fourier Approximation (N={N})', color='orange')
plt.title('Fourier Series Approximation of Periodic Square Wave')
plt.xlabel('Time [s]')
plt.ylabel('Amplitude')
plt.grid(True)
plt.axhline(0, color='black', linewidth=0.5)
plt.axvline(0, color='black', linewidth=0.5)
plt.legend()
plt.tight_layout()
plt.show()
