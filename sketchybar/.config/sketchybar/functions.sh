#!/bin/bash

source $CONFIG_DIR/colors.sh
source $CONFIG_DIR/helpers/icon_map.sh

__get_workspace_color() {
  workspace=$1

  case "${workspace}" in
    1) workspace_color=$COLOR_BLUE
    ;;
    2) workspace_color=$COLOR_GREEN
    ;;
    3) workspace_color=$COLOR_LAVENDER
    ;;
    4) workspace_color=$COLOR_YELLOW
    ;;
    5) workspace_color=$COLOR_PINK
    ;;
    *) workspace_color=$COLOR_BLUE
  esac
}

__update_workspace_item() {
  workspace=$1
  current_workspace=$2

  window_count=$(aerospace list-windows --workspace $workspace --count)

  __get_workspace_color $workspace

  if [ "$workspace" = "$current_workspace" ]; then
    bg_color=$workspace_color
    fg_color=$COLOR_MANTLE
  else
    if [ "$window_count" -gt 0 ]; then
      bg_color=$COLOR_BASE
      fg_color=$workspace_color
    else
      bg_color=$COLOR_BASE
      fg_color=$COLOR_SURFACE_1
    fi
  fi

  name="workspace.$workspace"
  options=(
    icon=$workspace
    icon.font="SF Pro:Semibold:16.0"
    icon.color=$fg_color
    label.color=$fg_color \
    label.padding_right=20
    background.drawing=on \
    background.color=$bg_color \
  )
  sketchybar --set "$name" "${options[@]}"
}

__update_workspace_icons() {
  workspace=$1

  apps=$(aerospace list-windows --workspace $workspace --format '%{app-name}')

  icons=""
  if [ -n "$apps" ]; then
    for app in $apps; do
      __icon_map "$app"
      if [ "$icon_result" != ":default:" ]; then
        icons+="$icon_result"
      fi
    done
  fi

  name="workspace.$workspace"
  options=(
    label="$icons" \
    label.font="sketchybar-app-font:Regular:16.0"
  )
  sketchybar --set "$name" "${options[@]}"
}

__update_front_app_item() {
  __get_workspace_color $1
  sketchybar --set front_app background.color=$workspace_color 
}

__update_separator_item() {
  __get_workspace_color $1
  sketchybar --set separator icon.color=$workspace_color 
}
