import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import butter, cheby1, cheby2, ellip, bessel, freqs, tf2zpk, impulse

F_pass = 1e3
F_stop = 1.5e3
R_p = 1
R_s = 30
w_pass = 0.5
w_stop = 1
w = np.logspace(2, 5, 1000)

b_butt, a_butt = butter(N=4, Wn=w_pass, btype='low', analog=True)
b_cheb1, a_cheb1 = cheby1(N=4, rp=R_p, Wn=w_pass, btype='low', analog=True)
b_cheb2, a_cheb2 = cheby2(N=4, rs=R_s, Wn=w_stop, btype='low', analog=True)
b_ellip, a_ellip = ellip(N=4, rp=R_p, rs=R_s, Wn=w_pass, btype='low', analog=True)
b_bessel, a_bessel = bessel(N=4, Wn=w_pass)

filters = {
    'Butterworth': (b_butt, a_butt),
}

plt.figure(figsize=(10, 6))
for name, (b, a) in filters.items():
    _, h = freqs(b, a, w)
    plt.semilogx(w / (2*np.pi), 20 * np.log10(np.abs(h)), label=name)
plt.axvline(F_pass, color='gray', linestyle='--')
plt.axvline(F_stop, color='gray', linestyle='--')
plt.grid(True, which='both', linestyle='--', alpha=0.5)
plt.legend()
plt.tight_layout()
plt.show()