import numpy as np
import matplotlib.pyplot as plt

T0 = 2.0
T1 = 0.5
num_periods = 1

t = np.linspace(-num_periods * T0 / 2, num_periods * T0 / 2, 1000)

t_mod = np.mod(t + T0 / 2, T0) - T0 / 2
x = np.where(np.abs(t_mod) < T1, 1, 0)

plt.style.use('seaborn-v0_8')
plt.figure(figsize=(10, 4))
plt.plot(t, x, color='blue', linewidth=2)
plt.title('Periodic Square Wave')
plt.xlabel('Time (t)')
plt.ylabel('x(t)')
plt.grid(True)
plt.tight_layout()
plt.show()
