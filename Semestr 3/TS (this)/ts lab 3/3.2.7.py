import numpy as np
import matplotlib.pyplot as plt

A = 0.666
Omega0 = 50
phi = 0
t = np.linspace(-1.5, 1.5, 1000)
Omega = np.linspace(-100, 100, 1000)

x2 = A * np.cos(Omega0 * t + phi)

X2 = np.array([np.trapz(x2 * np.exp(-1j * omega * t), t) for omega in Omega])

plt.figure(figsize=(10, 4))
plt.plot(Omega, np.abs(X2), label=r'$|X_2(\Omega)|$', color='blue')
plt.xlabel('Ω (rad/s)')
plt.ylabel('|X(Ω)|')
plt.grid(True)
plt.legend()
plt.show()
