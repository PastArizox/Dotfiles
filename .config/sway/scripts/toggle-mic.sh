#!/bin/bash

STATE=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -o '\[MUTED\]')
if [ "$STATE" = "[MUTED]" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0
    echo 0 | tee /sys/class/leds/platform::micmute/brightness
else
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1
    echo 1 | tee /sys/class/leds/platform::micmute/brightness
fi
