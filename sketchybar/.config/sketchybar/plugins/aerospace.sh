#!/bin/bash

source $CONFIG_DIR/colors.sh
source $CONFIG_DIR/functions.sh

if [ "$SENDER" = "aerospace_workspace_change" ]; then
  __update_workspace_item $1 $FOCUSED_WORKSPACE 
  __update_front_app_item $FOCUSED_WORKSPACE
  __update_separator_item $FOCUSED_WORKSPACE
fi

if [ "$SENDER" = "aerospace_focus_changed" ]; then
  __update_workspace_icons $1
fi
