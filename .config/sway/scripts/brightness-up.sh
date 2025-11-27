#!/usr/bin/env bash

brightnessctl set +5%

BRI=$(brightnessctl -m | awk -F, '{print $4}' | tr -d '%')

notify-send -a "Brightness" \
    -h string:x-canonical-private-synchronous:brightness \
    "Brightness" "Brightness : ${BRI}%"
