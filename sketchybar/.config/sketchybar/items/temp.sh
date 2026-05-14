#!/bin/bash

name="temp"
position="right"
options=(
  icon=􂬮
  update_freq=10
  script="$PLUGIN_DIR/temp.sh"
)

sketchybar \
  --add item "$name" "$position" \
  --set "$name" "${options[@]}" \
