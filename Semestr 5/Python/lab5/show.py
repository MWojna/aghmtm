import numpy as np
import matplotlib.pyplot as plt

s = np.loadtxt('samples.txt')
plt.plot(s[0:300], '-p') 	# kadrowanie
T_pwm = 10_000 				# okres 100 Hz [us]
n = 920 					# z wykresu
Ts = T_pwm / n 				# ok. 10.87 us

t = np.arange(len(s)) * 10.869
plt.plot(t, s, '-p')
plt.grid(True)
plt.xlabel("t[us]")
plt.show()