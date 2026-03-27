import numpy as np
import matplotlib.pyplot as plt

A = 0.666
Omega0 = 50
Omega_m = 10
k_AM = 0.5
phi = 0
t = np.linspace(-1.5, 1.5, 2000)
Omega = np.linspace(-100, 100, 3000)

x3 = (1 + k_AM * np.cos(Omega_m * t)) * np.cos(Omega0 * t + phi)

X3 = np.array([np.trapz(x3 * np.exp(-1j * omega * t), t) for omega in Omega])

plt.figure(figsize=(10, 4))
plt.plot(Omega, np.abs(X3), label=r'$|X_3(\Omega)|$', color='blue')
plt.xlabel('Ω ([)rad/s)')
plt.ylabel('|X(Ω)|')
plt.grid(True)
plt.show()
