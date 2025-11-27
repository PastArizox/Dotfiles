#!/bin/bash

screenshot_dir=~/Pictures/Screenshots
screenshot_filename=$(date +%Y-%m-%d_%H-%M-%S).png

grim -t png -l 9 -g "$(slurp)" "$screenshot_dir/$screenshot_filename" \
  && wl-copy < "$screenshot_dir/$screenshot_filename" \
  && notify-send -a "Capture d'écran" \
       -h string:x-canonical-private-synchronous:screenshot \
       "Capture d'écran" "La capture d'écran a été enregistrée et copiée dans le presse-papiers." \
       -i "$screenshot_dir/$screenshot_filename"
