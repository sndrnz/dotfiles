#!/bin/bash

cpu_temp=$(ismc temp -o json | jq -r '."CPU Die Average".value' | awk '{printf "%d\n", $1}')
if [ "$cpu_temp" = "null" ]; then
  cpu_temp="0 °C"
else
  cpu_temp="${cpu_temp} °C"
fi

sketchybar --set $NAME label="$cpu_temp"
