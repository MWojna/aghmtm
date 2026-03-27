import numpy as np
import matplotlib.pyplot as plt

# Parameters
C = 1        # Amplitude
a = 2        # Growth/decay rate
t = np.linspace(-2, 2, 400)  # Time range

# Exponential signal
x = C * np.exp(a * t)

# Plotting
plt.figure(figsize=(8, 4))
plt.plot(t, x, label=f'C={C}, a={a}')
plt.title('Continuous-Time Exponential Signal')
plt.xlabel('Time (t)')
plt.ylabel('x(t)')
plt.grid(True)
plt.legend()
plt.show()