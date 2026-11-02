#!/usr/bin/env bash
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/nvim"
DEST="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

if [ -e "$DEST" ] || [ -L "$DEST" ]; then
  BACKUP="${DEST}.bak.$(date +%Y%m%d%H%M%S)"
  echo "Saving previous config into $BACKUP"
  mv "$DEST" "$BACKUP"
fi

mkdir -p "$(dirname "$DEST")"
ln -s "$SRC" "$DEST"
