import numpy as np
import matplotlib.pyplot as plt

Omega0 = 1
t = np.linspace(0, 10, 400)

x = np.exp(1j * Omega0 * t)

x_real = np.real(x)
x_imag = np.imag(x)

plt.figure(figsize=(8, 4))
plt.plot(t, x_real, label='Real')
plt.plot(t, x_imag, label='Imag')
plt.title('Complex exponential signal ')
plt.xlabel('Time (t)')
plt.ylabel('x(t)')
plt.grid(True)
plt.legend()
plt.show()