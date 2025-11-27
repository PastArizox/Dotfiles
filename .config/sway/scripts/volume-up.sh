#!/bin/bash

pactl set-sink-volume @DEFAULT_SINK@ +5%

VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)

notify-send -a "Volume" \
    -h string:x-canonical-private-synchronous:volume \
    "Volume" "Volume : ${VOL}"