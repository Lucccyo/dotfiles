wallpaper_path=$1
colours_file="$HOME/colours"
sway_config="$HOME/.config/sway/config"
waybar_style="$HOME/.config/waybar/style.css"
alacritty_config="$HOME/.config/alacritty/alacritty.toml"
catppuccin_frappe_modifs="$HOME/.config/nvim/lua/plugins/catppuccin.lua"

set_waybar_colours() {
  # $1 -> line of the target colour
  # $2 -> identifier
  colour=$(sed -n "$1p" < "${colours_file}")
  sed -ri "s|^@define-color $2.*|@define-color $2 ${colour};|g" "${waybar_style}"
}

set_alacritty_colours() {
  # $1 -> line of the target colour
  # $2 -> identifier
  colour=$(sed -n "$1p" < "${colours_file}")
  sed -ri "s|^$2.*|$2 = \"${colour}\"|g" "${alacritty_config}"
}

set_catppuccin_frappe_colours() {
    # $1 -> line of the target colour
  # $2 -> identifier
  colour=$(sed -n "$1p" < "${colours_file}")
  sed -ri "s|^$2.*|$2 = \"${colour}\",|g" "${catppuccin_frappe_modifs}"
}


## set the wallpaper in sway config
sed -ri "s|^output \* bg.*|output \* bg $wallpaper_path fill|g" "${sway_config}"
sway reload

## picking colours from image
python gen_color.py "${wallpaper_path}" 30 > ${colours_file}

## waybar
set_waybar_colours 3 "background"
set_waybar_colours $(wc -l < ${colours_file}) "foreground"

## alacritty
set_alacritty_colours 3 "background"
set_alacritty_colours $(wc -l < ${colours_file}) "foreground"
set_alacritty_colours 27 "blue" # prompt colour
set_alacritty_colours 24 "yellow" # git branch colour

## catppuccin
set_catppuccin_frappe_colours 3 "base"
set_catppuccin_frappe_colours $(wc -l < ${colours_file}) "text"
set_catppuccin_frappe_colours 24 "mantle" # bar

sway reload
