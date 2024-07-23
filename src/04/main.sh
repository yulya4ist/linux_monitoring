#!/bin/bash

color="(^[1-6]{1}$)"

if [[ "$#" -ne 0 ]]; then
  echo "Wrong args"
else
  source color.cfg
  export BG1=$column1_background
  export F1=$column1_font_color
  export BG2=$column2_background
  export F2=$column2_font_color

  for i in $BG1 $F1 $BG2 $F2; do
    if ! [[ $i =~ $color ]]; then
      echo "Wrong input. Args in 1-6"
      exit 1
    fi
  done

#  echo "OK_1"
  chmod +x script.sh
  bash ./script.sh "$BG1" "$F1" "$BG2" "$F2"
fi