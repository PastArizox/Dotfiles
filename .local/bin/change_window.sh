#!/usr/bin/env bash
set -euo pipefail

# Liste des fenêtres: con_id + app_id/class + titre
choice="$(
  swaymsg -t get_tree | jq -r '
    def nodes: .nodes[]?, .floating_nodes[]?;
    def walk:
      . as $n
      | if ($n.nodes or $n.floating_nodes) then
          ($n | nodes | walk), $n
        else
          $n
        end;
    walk
    | select(.type=="con" and .name != null)
    | "\(.id)\t\(.app_id // .window_properties.class // "unknown")\t\(.name)"
  ' | wofi --dmenu --prompt "Focus window"
)"

[ -z "${choice}" ] && exit 0
con_id="$(printf '%s' "$choice" | cut -f1)"

swaymsg "[con_id=${con_id}] focus"

