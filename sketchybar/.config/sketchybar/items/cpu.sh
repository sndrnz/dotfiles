#!/bin/bash

name="cpu"
position="right"
options=(
  icon=􀧓
  update_freq=5
  script="$PLUGIN_DIR/cpu.sh"
)

sketchybar \
  --add item "$name" "$position" \
  --set "$name" "${options[@]}" \
