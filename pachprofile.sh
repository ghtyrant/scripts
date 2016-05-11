#!/bin/bash

CARD_ID=1
PROFILE_HEADSET="output:analog-stereo+input:analog-stereo"
PROFILE_MONITOR="output:iec958-stereo+input:analog-stereo"

CURRENT_PROFILE=$(pacmd list-cards | grep "active profile" | tail -n 1 | awk '{split($3, arr, "[<>]"); print arr[2]}')

if [[ "$CURRENT_PROFILE" == "$PROFILE_MONITOR" ]]; then
  pacmd set-card-profile $CARD_ID $PROFILE_HEADSET
  notify-send "PulseAudio Profile" "Switched to Headphones" -i /usr/share/pixmaps/pasystray.png
else
  pacmd set-card-profile $CARD_ID $PROFILE_MONITOR
  notify-send "PulseAudio Profile" "Switched to Speakers" -i /usr/share/pixmaps/pasystray.png
fi
