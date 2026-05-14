#!/bin/bash

if [ "$SENDER" = "front_app_switched" ]; then
  source "$CONFIG_DIR/helpers/icon_map.sh"

  __icon_map "$INFO"
  icon="$icon_result"

  sketchybar --set "$NAME" label="$INFO" icon="$icon"
fi
