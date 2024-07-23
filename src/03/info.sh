#!/bin/bash

white="\033[107m"
red="\033[41m"
green="\033[42m"
blue="\033[44m"
purple="\033[45m"
black="\033[40m"

arr[0]=$1
arr[1]=$2
arr[2]=$3
arr[3]=$4

for i in 0 1 2 3; do
  if [[ ${arr[$i]} == 1 ]]; then
    arr[$i]=$white
  elif [[ ${arr[$i]} == 2 ]]; then
    arr[$i]=$red
  elif [[ ${arr[$i]} == 3 ]]; then
    arr[$i]=$green
  elif [[ ${arr[$i]} == 4 ]]; then
    arr[$i]=$blue
  elif [[ ${arr[$i]} == 5 ]]; then
    arr[$i]=$purple
  elif [[ ${arr[$i]} == 6 ]]; then
    arr[$i]=$black
  fi
done

bg_1=${arr[0]}
font_1=${arr[1]}

bg_2=${arr[2]}
font_2=${arr[3]}

HOSTNAME=$(hostname)
echo -e "${bg_1}${font_1}HOSTNAME\033[0m = ${bg_2}${font_2}$HOSTNAME\033[0m"

TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
UTC=$(date +%z)
echo -e "${bg_1}${font_1}TIMEZONE\033[0m = ${bg_2}${font_2}$TIMEZONE UTC $UTC\033[0m"

#username
USER=$(whoami)
echo -e "${bg_1}${font_1}USER\033[0m = ${bg_2}${font_2}$USER\033[0m"

#os
OS=$(lsb_release -a | grep Description | awk '{print $2, $3}')
echo -e "${bg_1}${font_1}OS\033[0m = ${bg_2}${font_2}$OS\033[0m"

#date
DATE=$(date '+%d %b %Y %T')
echo -e "${bg_1}${font_1}DATE\033[0m = ${bg_2}${font_2}$DATE\033[0m"

#uptime
UPTIME=$(uptime -p)
echo -e "${bg_1}${font_1}UPTIME\033[0m = ${bg_2}${font_2}$UPTIME\033[0m"

#UPTIME_SEC
UPTIME_SEC=$(cat /proc/uptime | awk '{printf $1}')
echo -e "${bg_1}${font_1}UPTIME_SEC\033[0m = ${bg_2}${font_2}$UPTIME_SEC\033[0m"

#ip
IP=$(ifconfig | grep 'broadcast' | awk '{print $2}')
echo -e "${bg_1}${font_1}IP\033[0m = ${bg_2}${font_2}$IP\033[0m"

#MASK
MASK=$(ifconfig | grep 'broadcast' | awk '{print $4}')
echo -e "${bg_1}${font_1}MASK\033[0m = ${bg_2}${font_2}$MASK\033[0m"

#GATEWAY
GATEWAY=$(ip route | grep 'default' | awk '{print $3}')
echo -e "${bg_1}${font_1}GATEWAY\033[0m = ${bg_2}${font_2}$GATEWAY\033[0m"

RAM_TOTAL=$(free -h | grep -e 'Mem' | awk '{printf "%.3f GB", $2/1024}')
echo -e "${bg_1}${font_1}RAM_TOTAL\033[0m = ${bg_2}${font_2}$RAM_TOTAL\033[0m"
RAM_USED=$(free -h | grep -e 'Mem' | awk '{printf "%.3f GB", $3/1024}')
echo -e "${bg_1}${font_1}RAM_USED\033[0m = ${bg_2}${font_2}$RAM_USED\033[0m"
RAM_FREE=$(free -h | grep -e 'Mem' | awk '{printf "%.3f GB", $4/1024}')
echo -e "${bg_1}${font_1}RAM_FREE\033[0m = ${bg_2}${font_2}$RAM_FREE\033[0m"

SPACE_ROOT=$(df -h / | awk '{print $2}' | tail -1)
echo -e "${bg_1}${font_1}SPACE_ROOT\033[0m = ${bg_2}${font_2}$SPACE_ROOT\033[0m"
SPACE_ROOT_USED=$(df -h / | awk '{print $3}' | tail -1)
echo -e "${bg_1}${font_1}SPACE_ROOT_USED\033[0m = ${bg_2}${font_2}$SPACE_ROOT_USED\033[0m"
SPACE_ROOT_FREE=$(df -h / | awk '{print $4}' | tail -1)
echo -e "${bg_1}${font_1}SPACE_ROOT_FREE\033[0m = ${bg_2}${font_2}$SPACE_ROOT_FREE\033[0m"