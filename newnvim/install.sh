#!/usr/bin/env bash
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/nvim"
DEST="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

if [ -e "$DEST" ] || [ -L "$DEST" ]; then
  BACKUP="${DEST}.bak.$(date +%Y%m%d%H%M%S)"
  echo "Sauvegarde de l'ancienne config -> $BACKUP"
  mv "$DEST" "$BACKUP"
fi

mkdir -p "$(dirname "$DEST")"
ln -s "$SRC" "$DEST"
echo "Config liée : $DEST -> $SRC"

echo
echo "Dépendances requises (Arch) :"
echo "  sudo pacman -S --needed neovim git base-devel ripgrep fd tree-sitter-cli curl unzip"
echo
echo "Lance 'nvim' : plugins, lua_ls et parsers s'installent automatiquement au premier démarrage."
