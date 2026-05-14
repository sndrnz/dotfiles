#!/bin/bash

name="battery"
position="right"
options=(
  update_freq=120
  script="$PLUGIN_DIR/battery.sh"
)

sketchybar \
  --add item "$name" "$position" \
  --set "$name" "${options[@]}" \
  --subscribe "$name" system_woke power_source_change
