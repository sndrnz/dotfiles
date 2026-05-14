#!/bin/bash

name="volume"
position="right"
options=(
  script="$PLUGIN_DIR/volume.sh"
)

sketchybar \
  --add item "$name" "$position" \
  --set "$name" "${options[@]}" \
  --subscribe "$name" volume_change
