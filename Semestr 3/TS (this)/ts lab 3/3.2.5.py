import numpy as np
import matplotlib.pyplot as plt

T1 = 0.5
Omega = np.linspace(-250, 250, 1000)

X = abs(2 * np.sin(Omega * T1) / Omega)

plt.figure(figsize=(10, 4))
plt.plot(Omega, X, label='|X(Ω)|', color='purple')
plt.title('Fourier Transform of Rectangular Pulse')
plt.xlabel('Angular Frequency Ω [rad/s]')
plt.ylabel('Magnitude')
plt.grid(True)
plt.axhline(0, color='black', linewidth=0.5)
plt.legend()
plt.tight_layout()
plt.show()
