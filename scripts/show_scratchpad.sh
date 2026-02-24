#!/bin/bash

# Liste toutes les fenêtres du scratchpad
windows=$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.scratchpad_state=="inside") | .id, .app_id')

# On parcourt chaque fenêtre
ids=()
while read -r id && read -r app_id; do
    # On exclut Octodash
    if [[ "$app_id" != "Octodash" ]]; then
        ids+=("$id")
    fi
done <<< "$windows"

# On affiche les fenêtres restantes
for id in "${ids[@]}"; do
    swaymsg "[con_id=$id] scratchpad show"
done

