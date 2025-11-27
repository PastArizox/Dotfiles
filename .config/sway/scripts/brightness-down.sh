#!/usr/bin/env bash

# Diminue la luminosité de 5 %
brightnessctl set 5%-

# Récupère la luminosité actuelle en %
BRI=$(brightnessctl -m | awk -F, '{print $4}' | tr -d '%')

notify-send -a "Brightness" \
    -h string:x-canonical-private-synchronous:brightness \
    "Brightness" "Brightness : ${BRI}%"