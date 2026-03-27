import numpy as np
import matplotlib.pyplot as plt

kAM = 4
Omegam = 2
Omega0 = 2
fi = 1
t = np.linspace(-20, 20, 400)

x = (1 + kAM * np.cos(Omegam * t)) * np.cos(Omega0 * t + fi)

plt.figure(figsize=(8, 4))
plt.plot(t, x)
plt.title('Amplitude and Frequency modulation')
plt.xlabel('Time (t)')
plt.ylabel('x(t)')
plt.grid(True)
plt.legend()
plt.show()