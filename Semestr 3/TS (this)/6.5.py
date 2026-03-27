import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import butter, cheby1, cheby2, ellip, freqz, tf2zpk, lfilter

Fs = 5000
F_pass = 1000
F_stop = 1500
Rp = 1
Rs = 30

Wp = F_pass / (Fs / 2)
Ws = F_stop / (Fs / 2)

b_butter, a_butter = butter(N=4, Wn=Wp, btype='low', analog=False)
b_cheby1, a_cheby1 = cheby1(N=4, rp=Rp, Wn=Wp, btype='low', analog=False)
b_cheby2, a_cheby2 = cheby2(N=4, rs=Rs, Wn=Ws, btype='low', analog=False)
b_ellip, a_ellip = ellip(N=4, rp=Rp, rs=Rs, Wn=Wp, btype='low', analog=False)

filters = {
    'Butterworth': (b_butter, a_butter),
    'Chebyshev I': (b_cheby1, a_cheby1),
    'Chebyshev II': (b_cheby2, a_cheby2),
    'Elliptic': (b_ellip, a_ellip)
}

plt.figure(figsize=(10, 6))
for name, (b, a) in filters.items():
    w, h = freqz(b, a, worN=1024)
    plt.plot(w * Fs / (2 * np.pi), 20 * np.log10(abs(h)), label=name)
plt.title('Magnitude Response')
plt.xlabel('Frequency (Hz)')
plt.ylabel('Magnitude (dB)')
plt.grid(True)
plt.legend()

plt.figure(figsize=(10, 6))
for name, (b, a) in filters.items():
    w, h = freqz(b, a, worN=1024)
    plt.plot(w * Fs / (2 * np.pi), np.unwrap(np.angle(h)), label=name)
plt.title('Phase Response')
plt.xlabel('Frequency (Hz)')
plt.ylabel('Phase (radians)')
plt.grid(True)
plt.legend()

plt.figure(figsize=(10, 10))
for i, (name, (b, a)) in enumerate(filters.items(), 1):
    z, p, k = tf2zpk(b, a)
    plt.subplot(2, 2, i)
    plt.plot(np.real(z), np.imag(z), 'go', label='Zeros')
    plt.plot(np.real(p), np.imag(p), 'rx', label='Poles')
    plt.title(f'{name} Zeros and Poles')
    plt.xlabel('Real')
    plt.ylabel('Imaginary')
    plt.grid(True)
    plt.legend()
    plt.axis('equal')

impulse = np.zeros(50)
impulse[0] = 1
plt.figure(figsize=(10, 6))
for name, (b, a) in filters.items():
    response = lfilter(b, a, impulse)
    plt.stem(response, label=name, use_line_collection=True)
plt.title('Impulse Responses')
plt.xlabel('Sample')
plt.ylabel('Amplitude')
plt.grid(True)
plt.legend()

plt.tight_layout()
plt.show()