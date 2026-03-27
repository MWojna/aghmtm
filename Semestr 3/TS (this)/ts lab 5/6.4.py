import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import freqz

Fs = 4000
fc = 1000
wc = 2 * np.pi * fc / Fs

def ideal_lowpass(wc, M):
    n = np.arange(M)
    center = (M - 1) // 2
    h = np.zeros(M)
    for i in range(M):
        k = i - center
        if k == 0:
            h[i] = wc / np.pi
        else:
            h[i] = np.sin(wc * k) / (np.pi * k)
    return h

plt.figure(figsize=(10, 6))
for M in [11, 51, 101]:
    h = ideal_lowpass(wc, M)
    w, H = freqz(h, worN=1024, fs=Fs)
    plt.plot(w, 20 * np.log10(np.abs(H)), label=f'M={M}')
plt.xlabel('Częstotliwość [Hz]')
plt.ylabel('Amplituda [dB]')
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()