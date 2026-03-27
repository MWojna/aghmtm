import numpy as np
import matplotlib.pyplot as plt

# Parameters
Tmax = 1
N = 101

# Time vector
t = np.linspace(-Tmax, Tmax, num=N)

# Signal definition
x = -t**2 + 0.5*t + 2

# Time step
dt = t[1] - t[0]

# Rectangle method approximation
IR = np.sum(x[:-1]) * dt

# Trapezoid method approximation
IT = np.sum((x[:-1] + x[1:]) / 2) * dt

# True value of the integral
true_value = 10 / 3

# Errors
error_rect = abs(true_value - IR)
error_trap = abs(true_value - IT)

# Output results
print(f"Rectangle Approximation: {IR:.6f}, Error: {error_rect:.6f}")
print(f"Trapezoid Approximation: {IT:.6f}, Error: {error_trap:.6f}")