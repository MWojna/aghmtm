import numpy as np
import matplotlib.pyplot as plt

kAM = 4
kFM = 3
Omegam = 1
Omega0 = 1
fi = 1
t = np.linspace(-20, 20, 400)

x = np.cos(Omega0 * t + kFM * np.cos(Omegam * t))

plt.figure(figsize=(8, 4))
plt.plot(t, x)
plt.title('Amplitude and Frequency modulation')
plt.xlabel('Time (t)')
plt.ylabel('x(t)')
plt.grid(True)
plt.legend()
plt.show()