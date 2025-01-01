#!/bin/bash
set -e;

if ! pgrep discord >/dev/null; then echo "Launching discord..." && swaymsg "exec /usr/bin/discord"; fi

if ! pgrep spotify >/dev/null; then echo "Launching spotify..." && swaymsg "exec /usr/bin/spotify"; fi

if ! pgrep thunderbird >/dev/null; then echo "Launching thunderbird..." && swaymsg "exec /usr/bin/thunderbird"; fi
