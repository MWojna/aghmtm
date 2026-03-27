import numpy as np
import matplotlib.pyplot as plt

Tx = 2
Ty = 4
dt = 0.01

tx = np.arange(-Tx, Tx+dt, dt)
ty = np.arange(-Ty, Ty+dt, dt)

Nx = np.size(tx)
Ny = np.size(ty)

x = np.zeros(Nx)
h = np.zeros(Ny)
yt = np.zeros(Ny)
y = np.zeros(Ny)

ind = np.argwhere(abs(tx)<1)
x[ind] = 0.5
y[ind] = tx[ind] - 1


for ind in range(Ny):
    if ty[ind] >= -2 and ty[ind]<0:
        yt[ind] = 1/4*(ty[ind]+2)
    elif ty[ind]>=0 and ty[ind]<=2:
        yt[ind] = 1-1/4*ty[ind]**2

h=x
for indy in range(Ny):
    for indx in range(Nx):
        if indy-indx>=0 and indy-indx<Nx:
            y[indy] = y[indy] + x[indx]*h[indy-indx]*dt

plt.figure(figsize=(8, 4))
plt.plot(tx,x)
plt.plot(tx,h)
plt.plot(ty,y)
plt.title('Convolution integral')
plt.grid(True)
plt.legend()
plt.show()
