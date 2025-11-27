#!/bin/bash

pactl set-sink-mute @DEFAULT_SINK@ toggle

STATE=$(pactl get-sink-mute @DEFAULT_SINK@)

if [[ "$STATE" == "Mute: yes" ]]; then
    notify-send -a "Volume" \
        -h string:x-canonical-private-synchronous:volume \
        "Volume" "Son coupé"
else
    VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
    notify-send -a "Volume" \
        -h string:x-canonical-private-synchronous:volume \
        "Volume" "Volume : ${VOL}"
fi