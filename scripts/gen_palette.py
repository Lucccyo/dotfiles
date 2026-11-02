import math
import numpy as np

# refs colors
pink     = (242, 213, 207)
Mauve    = (202, 158, 230)
Red      = (231, 130, 132)
Maroon   = (234, 153, 156)
Peach    = (239, 159, 118)
Yellow   = (229, 200, 144)
Green    = (166, 209, 137)
Teal     = (129, 200, 190)
Sky      = (153, 209, 219)
Sapphire = (133, 193, 220)
Blue     = (140, 170, 238)
Lavender = (186, 187, 241)




# Matrice de transformation pour la conversion sRGB à XYZ
T = np.array([
    [0.4124564, 0.3575761, 0.1804375],
    [0.2126729, 0.7151522, 0.0721750],
    [0.0193339, 0.1191920, 0.9503041]
])

# Valeurs de référence pour D65
X_ref = 95.047
Y_ref = 100.000
Z_ref = 108.883

def rgb_norm(rgb: tuple[int, int, int]) -> tuple[float, float, float]:
    return (rgb[0] / 255, rgb[1] / 255, rgb[2] / 255)

def gamma(val: float) -> float:
    if val <= 0.04045:
        return val / 12.92
    else:
        return ((val + 0.055) / 1.055) ** 2.4

def rgb_correct(rgb: tuple[float, float, float]) -> tuple[float, float, float]:
    return (gamma(rgb[0]), gamma(rgb[1]), gamma(rgb[2]))

def to_xyz(rgb: tuple[float, float, float]) -> tuple[float, float, float]:
    A = np.array(rgb)
    xyz = np.dot(T, rgb)
    return (xyz[0] / X_ref, xyz[1] / Y_ref, xyz[2] / Z_ref)

def f(t):
    delta = 6/29
    if t > delta ** 3:
        return t ** (1 / 3)
    else:
        return t / (3 * delta ** 2) + 4 / 29

def to_cielab(rgb: tuple[int, int, int]) -> tuple[float, float, float]:
    # print(rgb)
    rgb1 = rgb_norm(rgb)
    # print(rgb1)
    rgb2 = rgb_correct(rgb1)
    # print(rgb2)
    xyz = to_xyz(rgb2)
    print("f ", xyz[0], " -->", f(xyz[0]))
    print(f(xyz[1]))
    print(f(xyz[2]))
    L = 116 * f(xyz[1]) - 16
    a = 500 * (f(xyz[0]) - f(xyz[1]))
    b = 200 * (f(xyz[1]) - f(xyz[2]))
    
    return (L, a, b)


red = (255, 0, 0)
print(to_cielab(red))


# Test de conversion
# colors = [(255, 0, 0), (0, 255, 0), (0, 0, 255), (255, 255, 0), (255, 0, 255)]

# for color in colors:
#     lab = to_cielab(color)
#     print(f"RGB: {color} -> CIELAB: L={lab[0]:.3f}, a={lab[1]:.3f}, b={lab[2]:.3f}")
