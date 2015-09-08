#!/bin/bash

DBUS_DEST=org.mpris.MediaPlayer2
DBUS_OBJ_PATH=/org/mpris/MediaPlayer2
PLAYER=spotify

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 playpause|next|previous"
  exit 1
fi

if [[ "$1" == "playpause" ]]; then
  dbus-send --print-reply --dest=$DBUS_DEST.$PLAYER $DBUS_OBJ_PATH $DBUS_DEST.Player.PlayPause
elif [[ "$1" == "next" ]]; then
  dbus-send --print-reply --dest=$DBUS_DEST.$PLAYER $DBUS_OBJ_PATH $DBUS_DEST.Player.Next
elif [[ "$1" == "previous" ]]; then
  dbus-send --print-reply --dest=$DBUS_DEST.$PLAYER $DBUS_OBJ_PATH $DBUS_DEST.Player.Previous
fi
