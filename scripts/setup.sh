wallpaper_path=$1
current_dir_path=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
colours_file="$HOME/colours"
sway_config="$HOME/.config/sway/config"
waybar_style="$HOME/.config/waybar/style.css"
alacritty_config="$HOME/.config/alacritty/alacritty.toml"
catppuccin_frappe_modifs="$HOME/.config/nvim/lua/plugins/catppuccin.lua"

set_waybar_colours() {
  # $1 -> string of colour "#00ffff"
  # $2 -> identifier
  sed -ri "s|^@define-color $2.*|@define-color $2 $1;|g" "${waybar_style}"
}

set_alacritty_colours() {
  # $1 -> string of colour "#00ffff"
  # $2 -> identifier
  sed -ri "s|^$2.*|$2 = \"$1\"|g" "${alacritty_config}"
}

set_catppuccin_frappe_colours() {
  # $1 -> string of colour "#00ffff"
  # $2 -> identifier
  sed -ri "s|^( *$2 = ).*|\1\"$1\",|g" "${catppuccin_frappe_modifs}"
}

get_colour() {
  # $1 -> line of the target colour
  echo "$(sed -n "$1p" < "${colours_file}")"
}

## setting the wallpaper in sway config
sed -ri "s|^output \* bg.*|output \* bg $wallpaper_path fill|g" "${sway_config}"

## picking colours from image
python "$current_dir_path/"gen_colour.py "${wallpaper_path}" 30 > ${colours_file}

## redundant colours
colour_l3=$(get_colour 3) # background
colour_l24=$(get_colour 24) # main colour
colour_light_l3=$(python "$current_dir_path/"illuminate.py "$colour_l3" 0.1) # subbackground
colour_lmax=$(get_colour $(wc -l < ${colours_file})) # text

## changing colours in waybar
set_waybar_colours "$colour_l3" "background"
set_waybar_colours "$colour_light_l3" "unfocused"
set_waybar_colours "$colour_lmax" "text"
set_waybar_colours "$colour_l24" "focused"
if [[ "$2" == "-s" || "$2" == "--shading" ]]; then
  ## with background's modules shading
  colour_basex="$colour_light_l3"
  for i in {7..1}; do
    colour_basex=$(python "$current_dir_path/"illuminate.py "$colour_basex" 0.03)
    set_waybar_colours "$colour_basex" "base$i"
  done
else
  ## with flat colour
  for i in {7..1}; do
    set_waybar_colours "$colour_light_l3" "base$i"
  done
fi

## changing colours in alacritty
set_alacritty_colours "$colour_l3" "background"
set_alacritty_colours "$colour_lmax" "foreground"
set_alacritty_colours "$colour_l24" "blue" # prompt colour
set_alacritty_colours "$colour_l24" "yellow" # git branch colour

## changing colours in nvim through the catppuccin colourtheme
set_catppuccin_frappe_colours "$colour_l3" "base"
set_catppuccin_frappe_colours "$colour_lmax" "text"
set_catppuccin_frappe_colours "$colour_l24" "mantle" # bar

sway reload
