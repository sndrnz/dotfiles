#!/bin/bash

name="fan"
position="right"
options=(
  icon=􁁌
  update_freq=10
  script="$PLUGIN_DIR/fan.sh"
)

sketchybar \
  --add item "$name" "$position" \
  --set "$name" "${options[@]}" \
