import numpy as np
import pandas as pd
from scipy.interpolate import griddata, RectBivariateSpline
from scipy.ndimage import binary_dilation, distance_transform_edt
from scipy.spatial import cKDTree
import matplotlib.pyplot as plt

# ----------------------------
# KONFIGURACJA
# ----------------------------
UPSAMPLE_FACTOR = 5          # Zwiększenie rozdzielczości danych
MAX_INTERPOLATION_GAP = 8    # Maksymalna luka do interpolacji (w komórkach)
CELL_SIZE_MM = 5             # Rozmiar komórki w milimetrach
ARROW_SPACING_MM = 10        # Odstęp między strzałkami w mm
CONTOUR_STEP = 1             # Krok linii ekwipotencjalnych [V]

# ----------------------------
# FUNKCJE POMOCNICZE
# ----------------------------
def limited_interpolation(V, max_gap=1):
    """Interpoluje tylko małe luki między danymi"""
    mask = ~np.isnan(V)
    
    # Tworzenie maski obszarów do interpolacji
    kernel = np.ones((3,3))
    dilated_mask = binary_dilation(mask, kernel, iterations=max_gap)
    
    # Interpolacja liniowa tylko w wybranych obszarach
    X, Y = np.meshgrid(np.arange(V.shape[1]), np.arange(V.shape[0]))
    valid_points = np.column_stack((X[mask], Y[mask]))
    valid_values = V[mask]
    
    interp_points = np.column_stack((X[dilated_mask], Y[dilated_mask]))
    interp_values = griddata(valid_points, valid_values, interp_points, method='linear')
    
    V_interp = V.copy()
    V_interp[dilated_mask] = np.where(mask[dilated_mask], V[dilated_mask], interp_values)
    return V_interp

def smart_upsample(V, factor):
    """Zwiększa rozdzielczość z zachowaniem dużych obszarów NaN"""
    nrows, ncols = V.shape
    x = np.linspace(0, ncols-1, ncols*factor)
    y = np.linspace(0, nrows-1, nrows*factor)
    
    # Interpolacja z ograniczeniem zasięgu
    valid_mask = ~np.isnan(V)
    tree = cKDTree(np.column_stack((np.where(valid_mask)[1], np.where(valid_mask)[0])))
    
    X_hr, Y_hr = np.meshgrid(x, y)
    points_hr = np.column_stack((X_hr.ravel(), Y_hr.ravel()))
    
    distances, _ = tree.query(points_hr, distance_upper_bound=2)
    V_hr = griddata(
        np.column_stack((np.where(valid_mask)[1], np.where(valid_mask)[0])),
        V[valid_mask],
        points_hr,
        method='linear',
        fill_value=np.nan
    )
    V_hr[distances > 2] = np.nan
    
    return V_hr.reshape(X_hr.shape), X_hr*CELL_SIZE_MM, Y_hr*CELL_SIZE_MM

def calculate_safe_gradient(V):
    """Oblicza gradient z zabezpieczeniem przed artefaktami"""
    grad_x = np.full_like(V, np.nan)
    grad_y = np.full_like(V, np.nan)
    mask = ~np.isnan(V)
    
    for i in range(1, V.shape[0]-1):
        for j in range(1, V.shape[1]-1):
            if np.all(mask[i-1:i+2, j-1:j+2]):
                grad_y[i,j] = (V[i+1,j] - V[i-1,j]) / (2*CELL_SIZE_MM)
                grad_x[i,j] = (V[i,j+1] - V[i,j-1]) / (2*CELL_SIZE_MM)
    return grad_x, grad_y

def create_arrow_grid(X_mm, Y_mm, spacing):
    """Generuje równomierną siatkę strzałek w przestrzeni fizycznej"""
    x_min, x_max = np.nanmin(X_mm), np.nanmax(X_mm)
    y_min, y_max = np.nanmin(Y_mm), np.nanmax(Y_mm)
    
    x_grid = np.arange(x_min + spacing/2, x_max, spacing)
    y_grid = np.arange(y_min + spacing/2, y_max, spacing)
    return np.meshgrid(x_grid, y_grid)

# ----------------------------
# GŁÓWNY KOD
# ----------------------------
# Wczytanie i przygotowanie danych
df = pd.read_excel('Fizyka2.xlsx', sheet_name='Arkusz1', header=None)
df.replace('', np.nan, inplace=True)
V_raw = df.to_numpy(dtype=float)

# Ograniczona interpolacja
V_interp = limited_interpolation(V_raw, MAX_INTERPOLATION_GAP)

# Zwiększenie rozdzielczości
V_highres, X_mm, Y_mm = smart_upsample(V_interp, UPSAMPLE_FACTOR)

# Obliczenie gradientu
grad_x, grad_y = calculate_safe_gradient(V_highres)

# Przygotowanie siatki strzałek
X_arrows, Y_arrows = create_arrow_grid(X_mm, Y_mm, ARROW_SPACING_MM)
tree = cKDTree(np.column_stack((X_mm.ravel(), Y_mm.ravel())))
distances, indices = tree.query(np.column_stack((X_arrows.ravel(), Y_arrows.ravel())), k=1)

# Filtracja wektorów
valid = ~np.isnan(V_highres.ravel()[indices])
X_valid = X_arrows.ravel()[valid]
Y_valid = Y_arrows.ravel()[valid]
grad_x_valid = grad_x.ravel()[indices][valid]
grad_y_valid = grad_y.ravel()[indices][valid]

# ----------------------------
# WIZUALIZACJA
# ----------------------------
plt.figure(figsize=(14, 10))

# Heatmapa z przezroczystością dla NaN - ustawiamy kolor NaN na szary
cmap = plt.cm.viridis.copy()
cmap.set_bad('gray', 1.0)
plt.pcolormesh(X_mm, Y_mm, V_highres, cmap='cool', shading='auto')

# Linie ekwipotencjalne
levels = np.arange(np.floor(np.nanmin(V_highres)), np.ceil(np.nanmax(V_highres))+1, CONTOUR_STEP)
cs = plt.contour(X_mm, Y_mm, V_highres, levels=levels, colors='black', linewidths=0.8)
plt.clabel(cs, inline=True, fontsize=9, fmt='%.1f V')

# Strzałki gradientu
plt.quiver(X_valid, Y_valid,
           -grad_x_valid, grad_y_valid,
           scale=1,
           color='black',
           width=0.002,
           headwidth=4,
           pivot='middle')

# Dodanie punktów pomiarowych (oryginalne dane) tylko dla komórek z danymi
nrows, ncols = V_raw.shape
x_meas = np.arange(ncols) * CELL_SIZE_MM
y_meas = np.arange(nrows) * CELL_SIZE_MM
X_meas, Y_meas = np.meshgrid(x_meas, y_meas)
mask_meas = ~np.isnan(V_raw)
plt.scatter(X_meas[mask_meas], Y_meas[mask_meas], c='white', marker='o', s=10, zorder=3)

# Dodanie elektrod – dla każdego punktu, gdzie wartość wynosi 10V lub 0V, rysujemy kwadrat 1x1 komórkę
for i in range(nrows):
    for j in range(ncols):
        # Sprawdzamy, czy mamy wartość pomiaru
        if not np.isnan(V_raw[i, j]):
            # Obliczamy środek komórki (punkt pomiarowy)
            x = j * CELL_SIZE_MM
            y = i * CELL_SIZE_MM
            # Obliczamy lewy dolny róg kwadratu, tak aby środek był w punkcie (x, y)
            lower_left = (x - CELL_SIZE_MM/2, y - CELL_SIZE_MM/2)
            if V_raw[i, j] == 10:
                rect = plt.Rectangle(lower_left, CELL_SIZE_MM, CELL_SIZE_MM,
                                     edgecolor='magenta', facecolor='magenta', alpha=0.5, zorder=4)
                plt.gca().add_patch(rect)
                plt.text(x, y, '10V',
                         ha='center', va='center', fontsize=10, color='black', zorder=5)
            elif V_raw[i, j] == 0:
                rect = plt.Rectangle(lower_left, CELL_SIZE_MM, CELL_SIZE_MM,
                                     edgecolor='cyan', facecolor='cyan', alpha=0.5, zorder=4)
                plt.gca().add_patch(rect)
                plt.text(x, y, '0V',
                         ha='center', va='center', fontsize=10, color='black', zorder=5)


# Konfiguracja wykresu
plt.gca().invert_yaxis()
plt.title('Rozkład pola elektrycznego w kondensatorze cylindrycznym', pad=15)
plt.xlabel('Położenie X [mm]', fontsize=12)
plt.ylabel('Położenie Y [mm]', fontsize=12)
plt.grid(linestyle=':', alpha=0.3)
plt.gca().set_aspect('equal')

plt.tight_layout()
plt.show()
