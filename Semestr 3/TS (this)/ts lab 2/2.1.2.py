import numpy as np
import matplotlib.pyplot as plt

Tmax = 1
N = 11
R = 21
N_vector = np.zeros(R)
IR_err = np.zeros(R)
IT_err = np.zeros(R)
for ind in range(R):
    N = N0+5*indt = np.linspace(-Tmax, Tmax, num=N)
    dt = t[1]-t[0]
    x = -t*t + 1/2*t + 2
    IR_err[ind] = abs(10/3 - np.sum(x[0:N-1])*dt)
    IT_err[ind] = abs(10/3 - np.sum(x[0:N-1]+x[1:N])*dt/2)
    N_vector[ind] = N
    print(ind)

plt.plot(N_vector, IR_err, 'r.-')
plt.plot(N_vector, IT_err, 'b.-')
plt.xlabel('N')
plt.ylabel('|error|')
plt.legend(['Rectangle','Trapezoid'])
plt.grid(True)
plt.yscale('log')