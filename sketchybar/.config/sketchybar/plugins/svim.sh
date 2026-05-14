#!/bin/bash

source "$CONFIG_DIR/colors.sh"

BG_COLOR_NORMAL=$COLOR_BLUE
BG_COLOR_INSERT=$COLOR_GREEN
BG_COLOR_VISUAL=$COLOR_MAUVE

FG_COLOR=$COLOR_CRUST

case "$MODE" in
  "N")
    bg_color=$BG_COLOR_NORMAL
    fg_color=$FG_COLOR
    label="N"
    ;;
  "I")
    bg_color=$BG_COLOR_INSERT
    fg_color=$FG_COLOR
    label="I"
    ;;
  "V")
    bg_color=$BG_COLOR_VISUAL
    fg_color=$FG_COLOR
    label="V"
    ;;
  *)
    bg_color=$COLOR_BASE
    fg_color=$COLOR_TEXT
    label=""
    ;;
esac

options=(
  icon.color=$fg_color
  label.color=$fg_color
  label="$label"
  background.color=$bg_color
)
sketchybar --set $NAME "${options[@]}"

