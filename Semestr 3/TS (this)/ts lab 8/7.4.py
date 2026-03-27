import numpy as np
import matplotlib.pyplot as plt

kAM = 4
Omegam = 2
Omega0 = 2
fi = 1
t = np.linspace(-20, 20, 400)

x = (1 + kAM * np.cos(Omegam * t)) * np.cos(Omega0 * t + fi)

L = 128
w = np.hanning(L)
Nfft = 256
R = 64

signal_length = x.shape[0]
n_segments = (signal_length - L) // R + 1

X = np.zeros((Nfft, n_segments), dtype=complex)

i = 0
while i < n_segments:
    start = i * R
    stop = start + L
    segment = x[start:stop] * w
    X[:, i] = np.fft.fft(segment, n=Nfft)
    i += 1

n_spe = np.arange(n_segments) * R / Omega0
w_spe = 2 * np.pi * np.arange(Nfft) / Nfft

plt.subplot(1, 2, 1)
plt.figure(figsize=(10, 5))
plt.imshow(20 * np.log10(np.abs(X[:Nfft//2, :])), aspect='auto', origin='lower',
           extent=[n_spe[0], n_spe[-1], w_spe[0], w_spe[Nfft//2-1]])
plt.xlabel('Czas')
plt.ylabel('Częstotliwość')
plt.ylim(0, 0.75)
plt.tight_layout()

plt.subplot(1, 2, 2)
plt.figure(figsize=(10, 5))
plt.ylim(0, 0.75)
plt.tight_layout()
plt.xlabel('Czas')
plt.ylabel('Częstotliwość')
plt.specgram(x, NFFT=256, Fs=Omega0, noverlap=128, cmap='viridis')
plt.show()