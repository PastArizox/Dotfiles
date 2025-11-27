#!/usr/bin/env bash
set -e

COLOR=$(grim -g "$(slurp -p)" -t ppm - \
  | magick - -format '%[pixel:p{0,0}]' txt:- \
  | tail -n 1 \
  | cut -d ' ' -f 4)

printf '%s\n' "$COLOR" | wl-copy

ICON_DIR="${XDG_RUNTIME_DIR:-/tmp}/colorpicker-icons"
mkdir -p "$ICON_DIR"

ICON_FILE="$ICON_DIR/$(echo "$COLOR" | tr -d '#').png"

magick -size 64x64 "xc:$COLOR" "$ICON_FILE"

notify-send -a "Pipette" \
  -h string:x-canonical-private-synchronous:colorpicker \
  "Couleur copiée" "$COLOR" \
  -i "$ICON_FILE"
