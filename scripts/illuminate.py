import sys
import math

def to_rgb(hex: str):
    hex: str = hex.lstrip('#')
    return tuple(int(hex[i:i+2], 16) for i in (0, 2, 4))

def of_rgb(rgb: tuple[int, int, int]):
    return '#{:02x}{:02x}{:02x}'.format(rgb[0], rgb[1], rgb[2])

def lighten(rgb: tuple[int, int, int], amt: float):
    ofs = math.floor(amt * (255 - max(rgb)))
    rgb = list(map(lambda c: c + ofs, rgb))
    return (min(rgb[0], 255), min(rgb[1], 255), min(rgb[2], 255))

color: str = sys.argv[1]
amt: float = float(sys.argv[2])
rgb = to_rgb(color)
rgb = lighten(rgb, amt)
print(of_rgb(rgb))
