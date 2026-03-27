import numpy as np
import matplotlib.pyplot as plt
from scipy.misc import electrocardiogram
from scipy import signal

Fs = 360
N = 1000

ecg_full = electrocardiogram()
ecg = ecg_full[:N]

t = np.arange(N) / Fs

f_sin = 50
A = 0.2

x = A * np.sin(2 * np.pi * f_sin * t)

ecg_dist = ecg + x

f0 = f_sin
Q = 30

b, a = signal.iirnotch(f0, Q, Fs)

filtered_ecg = signal.lfilter(b, a, ecg_dist)

L = N
Y_ecg = np.fft.fft(ecg, L) / L
Y_distorted = np.fft.fft(ecg_dist, L) / L
Y_filtered = np.fft.fft(filtered_ecg, L) / L

f_vec = np.fft.fftfreq(L, 1/Fs)[:L//2]

w, h = signal.freqz(b, a, worN=L, fs=Fs)
H_filter = np.abs(h)


plt.figure(figsize=(14, 10))

plt.subplot(3, 2, 1)
plt.plot(t, ecg, 'r-', label='ECG')
plt.title('ECG signal')
plt.xlabel('Time (s)')
plt.ylabel('Magnitude')
plt.legend()
plt.grid(True)

plt.subplot(3, 2, 3)
plt.plot(t, ecg_dist, label='distorted ECG')
plt.title('ECG signal distorted by additive 50 Hz sinusoid')
plt.xlabel('Time (s)')
plt.ylabel('Magnitude')
plt.legend()
plt.grid(True)

plt.subplot(3, 2, 5)
plt.plot(t, filtered_ecg, label='distorted ECG after filtration')
plt.title('Distorted ECG signal after filtration')
plt.xlabel('Time (s)')
plt.ylabel('Magnitude')
plt.legend()
plt.grid(True)

plt.subplot(3, 2, 2)
plt.plot(w, H_filter, 'b', label='filter')
plt.title('Applied filter magnitude response')
plt.xlabel('F (Hz)')
plt.ylabel('Magnitude')
plt.xlim(0, Fs/2)
plt.grid(True)

plt.xlim(0, 60)
plt.title('Magnitude spectra of signals')
plt.xlabel('F (Hz)')
plt.ylabel('Magnitude')
plt.legend()
plt.grid(True)

plt.tight_layout(rect=[0, 0.03, 1, 0.95])
plt.show()
