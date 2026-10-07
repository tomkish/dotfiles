#!/bin/bash
swaync-client --reload-css
swaync-client --reload-config
if pgrep -x waybar > /dev/null; then
    pkill waybar
    pkill -f "cava -p /tmp/polybar_cava_config"
else
    waybar &
fi
