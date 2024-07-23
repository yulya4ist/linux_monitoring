#!/bin/bash

hostname="$1"
timezone="$2"
user="$3"
os="$4"
date="$5"
uptime="$6"
uptime_sec="$7"
ip="$8"
mask="$9"
gateway="${10}"
ram_total="${11}"
ram_used="${12}"
ram_free="${13}"
space_root="${14}"
space_root_used="${15}"
space_root_free="${16}"

read -p "Save the information to a file? (Y/N) " answer

if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
  curTime=$(date '+%d_%m_%Y_%H_%M_%S')
  file_name="$curTime.status"

  echo "HOSTNAME: $hostname" >> $file_name
  echo "TIMEZONE: $timezone UTC $UTC" >> $file_name
  echo "USER: $user" >> $file_name
  echo "OS: $os" >> $file_name
  echo "DATE: $date" >> $file_name
  echo "UPTIME: $uptime" >> $file_name
  echo "UPTIME_SEC: $uptime_sec" >> $file_name
  echo "IP: $ip" >> $file_name
  echo "MASK: $mask" >> $file_name
  echo "GATEWAY: $gateway" >> $file_name
  echo "RAM_TOTAL: $ram_total" >> $file_name
  echo "RAM_USED: $ram_used" >> $file_name
  echo "RAM_FREE: $ram_free" >> $file_name
  echo "SPACE_ROOT: $space_root" >> $file_name
  echo "SPACE_ROOT_USED: $space_root_used" >> $file_name
  echo "SPACE_ROOT_FREE: $space_root_free" >> $file_name

  echo "Saved in $file_name"
else
  echo "skip."
fi