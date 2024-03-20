import sys
import math
import colorsys
from colorthief import ColorThief
import matplotlib.colors as mc

file_name: str = sys.argv[1]
size: int = int(sys.argv[2])

def display(l):
    for e in l:
        print(e)

def lighten(rgb: tuple[int, int, int], amt: float):
    ofs = math.floor(amt * (255 - max(rgb)))
    rgb = list(map(lambda c: c + ofs, rgb))
    return (min(rgb[0], 255), min(rgb[1], 255), min(rgb[2], 255))

def rgb_to_hex(rgb: tuple[int, int, int]):
    return '#{:02x}{:02x}{:02x}'.format(rgb[0], rgb[1], rgb[2])

def get_palette(file_name: str, size: int):
  color_thief = ColorThief(file_name)
  return color_thief.get_palette(color_count=size + 1)

def lum(rgb: tuple[int, int, int]):
  return math.sqrt(0.241 * rgb[0] + 0.691 * rgb[1] + 0.068 * rgb[2])

palette: tuple[int, int, int] = get_palette(file_name, size)
palette.sort(key=lambda rgb:lum(rgb))
palette.append(lighten(palette[-1], 0.7))
palette = map(rgb_to_hex, palette)

display(list(palette))
