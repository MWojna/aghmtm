import numpy as np
import matplotlib.pyplot as plt

Tmax = 1
N = 101

t = np.linspace(-Tmax, Tmax, num=N)

x = np.where(np.abs(t) < 1, 0.5, 0)
h = np.where(np.abs(t) < 1, -t+1, 0)
y = x * h

dt = t[1] - t[0]

IR = np.sum(x[:-1]) * dt

IT = np.sum((x[:-1] + x[1:]) / 2) * dt

true_value = 10 / 3

error_rect = abs(true_value - IR)
error_trap = abs(true_value - IT)

print(f"Rectangle Approximation: {IR:.6f}, Error: {error_rect:.6f}")
print(f"Trapezoid Approximation: {IT:.6f}, Error: {error_trap:.6f}")

plt.figure(figsize=(8, 4))
plt.plot(t, x)
plt.plot(t, h)
plt.plot(t, y)
plt.title('Convolution integral')
plt.grid(True)
plt.legend()
plt.show()


for indy in range(Ny):
    for indx in range(Nx):
        if indy-indx>=0 and indy-indx<Nx:
            y[indy] = y[indy] + x[indx]*h[indy-indx]*dt
