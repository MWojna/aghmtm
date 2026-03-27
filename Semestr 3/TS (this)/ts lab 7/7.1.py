import numpy as np
import matplotlib.pyplot as plt

def dtft(x, n, omega):
    E = np.exp(-1j * np.outer(omega, n))
    return E @ x

def make_signals(M, omega0):

    n = np.arange(-M, M + 1)
    x_const = np.ones_like(n, dtype=np.complex128)
    x_cexp  = np.exp(1j * omega0 * n)
    x_cos   = np.cos(omega0 * n).astype(np.complex128)
    return n, x_const, x_cexp, x_cos

def plot_dtft(M=20, omega0=0.4*np.pi, Nw=2048):

    omega = np.linspace(-np.pi, np.pi, Nw, endpoint=False)

    n, x_const, x_cexp, x_cos = make_signals(M, omega0)

    X_const = dtft(x_const, n, omega)
    X_cexp  = dtft(x_cexp,  n, omega)
    X_cos   = dtft(x_cos,   n, omega)

    mag_const = np.abs(X_const)
    mag_cexp  = np.abs(X_cexp)
    mag_cos   = np.abs(X_cos)

    plt.figure(figsize=(12, 8))

    plt.subplot(3, 1, 1)
    plt.plot(omega, mag_const, color='navy')
    plt.title(f'DTFT |X_const(e^{{jω}})|, M={M}')
    plt.xlabel('ω [rad]')
    plt.ylabel('|X|')
    plt.grid(True, alpha=0.3)

    plt.subplot(3, 1, 2)
    plt.plot(omega, mag_cexp, color='darkred')
    plt.title(f'DTFT |X_cexp(e^{{jω}})|, M={M}, ω0={omega0:.3f} rad')
    plt.xlabel('ω [rad]')
    plt.ylabel('|X|')
    plt.grid(True, alpha=0.3)

    plt.subplot(3, 1, 3)
    plt.plot(omega, mag_cos, color='darkgreen')
    plt.title(f'DTFT |X_cos(e^{{jω}})|, M={M}, ω0={omega0:.3f} rad')
    plt.xlabel('ω [rad]')
    plt.ylabel('|X|')
    plt.grid(True, alpha=0.3)

    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    plot_dtft(M=20, omega0=0.4*np.pi, Nw=4096)