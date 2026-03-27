import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import freqs_zpk, impulse

f_notch = 50
w0 = 2 * np.pi * f_notch
a = 0
b = w0
c = 10
gain = 1.0

zeros = [-a + 1j*b, -a - 1j*b]
poles = [-c + 1j*b, -c - 1j*b]

frequencies = np.logspace(1, 3, 1000)
w = 2 * np.pi * frequencies
_, h = freqs_zpk(zeros, poles, gain, w)

plt.figure()
plt.semilogx(frequencies, 20 * np.log10(abs(h)))
plt.grid(True)
plt.axvline(f_notch, color='red',label='50 Hz')
plt.xlim(40, 60)
plt.legend()
plt.show()

num = gain * np.poly(zeros)
den = np.poly(poles)
t = np.linspace(0, 0.5, 5000)
t, y = impulse((num, den), T=t)

plt.figure()
plt.plot(t, y)
plt.grid(True)
plt.show()
