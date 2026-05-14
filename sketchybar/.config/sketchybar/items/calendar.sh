#!/bin/bash

name="calendar"
position="right"
options=(
  icon=􀧞
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
)

sketchybar \
  --add item "$name" "$position" \
  --set "$name" "${options[@]}"
