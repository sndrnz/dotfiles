#!/bin/bash

source $CONFIG_DIR/colors.sh
source $CONFIG_DIR/functions.sh

sketchybar --add event aerospace_workspace_change
sketchybar --add event aerospace_focus_changed

current_workspace=$(aerospace list-workspaces --focused)

for workspace in $(aerospace list-workspaces --all); do
  name="workspace.$workspace"
  position="left"
  options=(
    click_script="aerospace workspace $workspace"
    script="$CONFIG_DIR/plugins/aerospace.sh $workspace"
  )

  sketchybar --add item "$name" "$position" \
    --subscribe "$name" aerospace_workspace_change aerospace_focus_changed  \
    --set "$name" "${options[@]}"

  __update_workspace_item $workspace $current_workspace
  __update_workspace_icons $workspace
done

name="separator"
position="left"
options=(
  icon=􀆊
  icon.color=$COLOR_BLUE
  icon.padding_left=4
  label.drawing=off
  background.drawing=off
)
sketchybar --add item "$name" "$position" \
  --set "$name" "${options[@]}"

