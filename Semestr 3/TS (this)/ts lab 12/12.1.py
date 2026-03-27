import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import hilbert

fs = 1000
T = 1.0
n = np.arange(0, int(fs * T))
t = n / fs

f0 = 50.0
fm = 3.0
kam = 0.7

m_n = np.cos(2 * np.pi * fm * t)

x_n = (1 + kam * m_n) * np.cos(2 * np.pi * f0 * t)

analytic_signal = hilbert(x_n)

instantaneous_amplitude = np.abs(analytic_signal)

plt.figure(figsize=(12, 8))

plt.subplot(2, 1, 1)
plt.plot(t, x_n, label='Sygnał AM x[n]', alpha=0.6)
plt.plot(t, instantaneous_amplitude, label='Obwiednia (hilbert)', linewidth=2, linestyle='--')

plt.grid(True)

theoretical_envelope = 1 + kam * m_n

plt.subplot(2, 1, 2)
plt.plot(t, theoretical_envelope, label='Teoretyczna obwiednia $(1 + k_{AM} m[n])$', linewidth=3, alpha=0.5)
plt.plot(t, instantaneous_amplitude, label='Odtworzona obwiednia (z Hilberta)', linestyle='--')

plt.grid(True)

plt.tight_layout()
plt.show()