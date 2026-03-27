import numpy as np
import matplotlib.pyplot as plt

T0 = 2.0
T1 = 0.5
t = np.linspace(-5*T0, 5*T0, 1000)

Omega0 = 2 * np.pi / T0

folded_t = np.mod(t + T0/2, T0) - T0/2
x = np.where(np.abs(folded_t) < T1, 1, 0)

plt.figure(figsize=(10, 4))
plt.plot(t, x, label='x(t)', color='blue')
plt.title('Periodic Square Wave')
plt.xlabel('Time [s]')
plt.ylabel('Amplitude')
plt.grid(True)
plt.axhline(0, color='black', linewidth=0.5)
plt.axvline(0, color='black', linewidth=0.5)
plt.tight_layout()
plt.show()