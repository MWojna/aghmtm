import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import freqz, lfilter, dimpulse

Fs = 1000
f_notch = 75

r1 = 1
r2 = 0.95
omega = 2 * np.pi * f_notch / Fs #konwertowanie Hz na radiany

b = np.poly([r1 * np.exp(1j * omega), r1 * np.exp(-1j * omega)]).real
a = np.poly([r2 * np.exp(1j * omega), r2 * np.exp(-1j * omega)]).real

impulse = np.zeros(100)
impulse[0] = 1
response = lfilter(b, a, impulse)

w, h = freqz(b, a, worN=1024, fs=Fs)

plt.figure(figsize=(12, 5))

plt.subplot(1, 2, 1)
plt.stem(response, basefmt=" ")
plt.grid(True)
plt.ylim(-0.2,0.2)
plt.xlim(0,80)

plt.subplot(1, 2, 2)
plt.plot(w, 20 * np.log10(abs(h)))
plt.legend()
plt.grid(True)
plt.xlim(0,200)
plt.show()