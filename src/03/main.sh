#!/bin/bash
#task3
color="(^[1-6]{1}$)"

if [ "$#" -ne 4 ]; then
  echo "Enter 4 args"
elif ! [[ $1 =~ $color ]] || ! [[ $2 =~ $color ]] || ! [[ $3 =~ $color ]] || ! [[ $4 =~ $color ]]; then
  echo "args must be in 1-6"
elif [ $1 == $2 ] || [ $3 == $4 ]; then
  echo "Color of bg and font must be different"

  read -p "Restart skript?" answer

  if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
    read -p "Enter new args " q1 q2 q3 q4
    bash main.sh "$q1" "$q2" "$q3" "$q4"
  else
    echo "Ok. Bye."
  fi

else
  chmod +x info.sh
#  echo "OK"
  bash info.sh "$1" "$2" "$3" "$4"
fi