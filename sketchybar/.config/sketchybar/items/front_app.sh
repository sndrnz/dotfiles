#!/bin/bash

name="front_app"
position="left"
options=(
  background.color=$COLOR_BLUE
  icon.color=$COLOR_MANTLE
  icon.font="sketchybar-app-font:Regular:16.0"
  label.color=$COLOR_MANTLE
  script="$PLUGIN_DIR/front_app.sh"
)

sketchybar \
  --add item "$name" "$position" \
  --set "$name" "${options[@]}" \
  --subscribe "$name" front_app_switched
