#!/bin/bash
set -e

FILENAME="$HOME/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png"

FOCUSED=$(swaymsg -t get_tree | jq '.. | ((.nodes? + .floating_nodes?) // empty) | .[] | select(.focused and .pid) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')

grim -g "$(eval echo $FOCUSED)" "$FILENAME" && wl-copy < $FILENAME
