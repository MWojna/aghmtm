import numpy as np
import matplotlib.pyplot as plt

Fs = 100
F = 20
DC = 1
A = 1
phi = np.pi / 5

def generate_signal(N):
    t = 1 / Fs
    x = DC + A * np.cos(2 * np.pi * F * t + phi)
    return x

def compute_dft(x, N_fft):
    X = np.fft.fft(x, n=N_fft)
    f = np.fft.fftfreq(N_fft, d=1/Fs)
    return f[:N_fft//2], np.abs(X[:N_fft//2])

def plot_dft_comparison():
    Ns = [30, 32, 64, 65]
    plt.figure(figsize=(10, 6))

    for N in Ns:
        x = generate_signal(N)
        f, X = compute_dft(x, N)
        plt.plot(f, X, label=f'N = {N}', marker='o')

    plt.title('Porównanie DFT: N = 30, 32, 64, 65')
    plt.xlabel('Częstotliwość [Hz]')
    plt.ylabel('Moduł DFT')
    plt.grid(True)
    plt.legend()

if __name__ == "__main__":
    plot_dft_comparison()
    plt.show()