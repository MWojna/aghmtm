import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import freqs

def freqs_lab(B, A, Om):
    s = 1j * Om
    Bs = np.polyval(B, s)
    As = np.polyval(A, s)
    H = Bs / As
    return H

B = [1]
A = [1, 1, 1]
Om = np.logspace(-1, 2, 500)

H_custom = freqs_lab(B, A, Om)
w, H_scipy = freqs(B, A, Om)

plt.figure(figsize=(10, 6))
plt.semilogx(Om, 20 * np.log10(np.abs(H_custom)), label='freqs_lab (custom)', linewidth=2)
plt.semilogx(w, 20 * np.log10(np.abs(H_scipy)), '--', label='scipy.signal.freqs', linewidth=2)
plt.grid(True, which='both', linestyle='--', alpha=0.5)
plt.legend()
plt.tight_layout()
plt.show()