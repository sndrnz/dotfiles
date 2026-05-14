#!/bin/bash

if [ "$SENDER" = "volume_change" ]; then
  VOLUME=$INFO

  case $VOLUME in
    7[6-9]|[8-9][1-9]|100) ICON="􀊩"
    ;;
    [5-6][1-9]|7[0-5]) ICON="􀊧"
    ;;
    2[6-9]|[3-4][0-9]|50) ICON="􀊥"
    ;;
    [1-9]|1[0-9]|2[0-5]) ICON="􀊡"
    ;;
    *) ICON="􀊣"
    ;;
  esac

  sketchybar --set $NAME icon="$ICON" label="$VOLUME%"
fi
