#!/bin/bash

# Toggle network on/pff
if nmcli networking connectivity | grep -q "none"; then
    nmcli networking on
else
    nmcli networking off
fi