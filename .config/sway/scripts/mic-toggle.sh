#!/bin/bash

STATE=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -o '\[MUTED\]')
if [ "$STATE" = "[MUTED]" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0
    echo 0 | sudo tee /sys/class/leds/platform::micmute/brightness
    notify-send -a "Micro" \
        -h string:x-canonical-private-synchronous:mic \
        "Micro" "Micro activé"
else
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1
    echo 1 | sudo tee /sys/class/leds/platform::micmute/brightness
    notify-send -a "Micro" \
        -h string:x-canonical-private-synchronous:mic \
        "Micro" "Micro coupé"
fi
