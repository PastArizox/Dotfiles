#!/bin/bash

WAYBAR_PID=$(pgrep -x waybar)

if [ -n "$WAYBAR_PID" ]; then
    kill "$WAYBAR_PID"
else
    nohup waybar >/dev/null 2>&1 &
fi

