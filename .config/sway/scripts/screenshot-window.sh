#!/bin/bash
set -e

screenshot_dir=~/Pictures/Screenshots
screenshot_filename=$(date +%Y-%m-%d_%H-%M-%S).png

focused=$(swaymsg -t get_tree | jq '.. | ((.nodes? + .floating_nodes?) // empty) | .[] | select(.focused and .pid) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')

grim -g "$(eval echo "$focused")" "$screenshot_dir/$screenshot_filename" \
  && wl-copy < "$screenshot_dir/$screenshot_filename" \
  && notify-send -a "Capture d'écran" \
       -h string:x-canonical-private-synchronous:screenshot \
       "Capture d'écran" "La capture d'écran de la fenêtre acutelle a été enregistrée et copiée dans le presse-papiers." \
       -i "$screenshot_dir/$screenshot_filename"