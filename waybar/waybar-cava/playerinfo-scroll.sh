#!/bin/bash
maxlen=30
minlen=20

pos=0
prev_text=""

while true; do
    text=$(playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null)

    if [ "$text" != "$prev_text" ]; then
        pos=0
        prev_text="$text"
    fi

    if [ -z "$text" ]; then
        printf "%-${minlen}s\n" ""
    elif [ ${#text} -le $maxlen ]; then
        printf "%-${minlen}s\n" "$text"
    else
        scrolltext="$text     "
        len=${#scrolltext}
        rotated="${scrolltext:pos}${scrolltext:0:pos}"
        echo "${rotated:0:maxlen}"
        pos=$(( (pos + 1) % len ))
    fi

    sleep 0.3
done
