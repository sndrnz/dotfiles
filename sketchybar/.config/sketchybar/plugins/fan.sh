#!/bin/bash

fan_speed=$(ismc fans -o json | jq -r '."Fan 1 Current Speed".value' | awk '{print $1}')
if [ "$fan_speed" = "null" ]; then
  fan_speed="0 rpm"
else
  fan_speed="${fan_speed} rpm"
fi

sketchybar --set $NAME label="$fan_speed"
