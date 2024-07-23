#!/bin/bash
#task 1
if [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]]; then
  echo "Wrong input"
else
  echo $1
fi