import numpy as np
import matplotlib.pyplot as plt
from scipy.misc import electrocardiogram
from scipy import signal

Fs = 360
N = 1000

ecg_full = electrocardiogram()
ecg = ecg_full[:N]

t = np.arange(N) / Fs

std_dev = 0.1
gaussian_noise = std_dev * np.random.randn(N)

distorted_ecg = ecg + gaussian_noise

order = 4
fc = 30
nyquist = 0.5 * Fs
Wn = fc / nyquist

b, a = signal.butter(order, Wn, btype='low', analog=False)

filtered_ecg = signal.lfilter(b, a, distorted_ecg)

L = N
Y_ecg = np.fft.fft(ecg, L) / L
Y_distorted = np.fft.fft(distorted_ecg, L) / L
Y_filtered = np.fft.fft(filtered_ecg, L) / L

f_vec = np.fft.fftfreq(L, 1/Fs)[:L//2]

w, h = signal.freqz(b, a, worN=L, fs=Fs)
H_filter_dB = 20 * np.log10(np.abs(h))

plt.figure(figsize=(14, 6))

plt.subplot(1, 2, 1)
plt.plot(t, distorted_ecg, 'g.', linestyle='-', markersize=2, label='distorted ECG')
plt.plot(t, filtered_ecg, 'b-', label='distorted ECG after filtration')
plt.plot(t, ecg, 'r-', label='ECG')
plt.xlabel('t (s)')
plt.ylabel('Magnitude')
plt.legend()
plt.grid(True)
plt.xlim(t[0], t[-1])

plt.subplot(1, 2, 2)

mag_ecg_dB = 20 * np.log10(np.abs(Y_ecg[:L//2]))
mag_distorted_dB = 20 * np.log10(np.abs(Y_distorted[:L//2]))
mag_filtered_dB = 20 * np.log10(np.abs(Y_filtered[:L//2]))

plt.plot(w, H_filter_dB, 'b-', linewidth=2, label='applied lowpass filter')

plt.plot(f_vec, mag_ecg_dB, 'r-', label='ECG')
plt.plot(f_vec, mag_distorted_dB, 'k--', label='distorted ECG')


plt.xlabel('F (Hz)')
plt.ylabel('Magnitude (dB)')
plt.legend()
plt.grid(True)
plt.xlim(0, Fs/2)
plt.ylim(-100, 10)

plt.tight_layout()
plt.show()