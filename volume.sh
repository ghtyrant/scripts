#!/bin/sh

if [ "$1" = "up" ]; then
  pacmd dump|awk --non-decimal-data '$1~/set-sink-volume/{system ("pacmd "$1" "$2" "$3+1000)}'
elif [ "$1" = "down" ]; then
  pacmd dump|awk --non-decimal-data '$1~/set-sink-volume/{system ("pacmd "$1" "$2" "$3-1000)}'
elif [ "$1" = "mute" ]; then
  pacmd dump|awk --non-decimal-data '$1~/set-sink-mute/{system ("pacmd "$1" "$2" "($3=="yes"?"no":"yes"))}'
fi
