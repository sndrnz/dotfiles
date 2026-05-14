#!/bin/bash

sketchybar --add event svim_mode_change

name="svim"
position="right"
options=(
  icon=":vim:"
  icon.font="sketchybar-app-font:Regular:16.0"
  label.font="Hack Nerd Font Mono:Bold:16.0"
  script="$PLUGIN_DIR/svim.sh"
)

sketchybar \
  --add item "$name" "$position" \
  --set "$name" "${options[@]}" \
  --subscribe "$name" svim_mode_change

