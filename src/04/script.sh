#!/bin/bash

white="\033[107m"
red="\033[41m"
green="\033[42m"
blue="\033[44m"
purple="\033[45m"
black="\033[40m"

def1=1
def2=2
def3=3
def4=4

arr[0]=$BG1
arr[1]=$F1
arr[2]=$BG2
arr[3]=$F2

#проверка на отсутсвие аргументов в файле
if [[ -z ${arr[0]} ]]; then
  def_flag[0]=1
  arr[0]=$def1
fi
if [[ -z ${arr[1]} ]]; then
  def_flag[1]=1
  arr[1]=$def2
fi
if [[ -z ${arr[2]} ]]; then
  def_flag[2]=1
  arr[2]=$def3
fi
if [[ -z ${arr[3]} ]]; then
  def_flag[3]=1
  arr[3]=$def4
fi


for i in 0 1 2 3; do
  if [[ ${arr[$i]} == 1 ]]; then
      arr[$i]=$white
    color[$i]="white"
  elif [[ ${arr[$i]} == 2 ]]; then
      arr[$i]=$red
    color[$i]="red"
  elif [[ ${arr[$i]} == 3 ]]; then
      arr[$i]=$green
    color[$i]="green"
  elif [[ ${arr[$i]} == 4 ]]; then
      arr[$i]=$blue
    color[$i]="blue"
  elif [[ ${arr[$i]} == 5 ]]; then
      arr[$i]=$purple
    color[$i]="purple"
  elif [[ ${arr[$i]} == 6 ]]; then
      arr[$i]=$black
    color[$i]="black"
  fi
done

bg_1=${arr[0]}
font_1=${arr[1]}
bg_2=${arr[2]}
font_2=${arr[3]}

#echo $bg_1 $font_1 $bg_2
#выводим в консоль инфу

#chmod +x print.sh
#bash print.sh "$BG1" "$font_1" "$bg_2" "$font_2"


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
if [[ ${def_flag[0]} == 1 ]]; then
  echo "Column 1 background = default (white)"
else
  echo "Column 1 background = $BG1 (${color[0]})"
fi

if [[ ${def_flag[1]} == 1 ]]; then
  echo "Column 1 font color = default (red)"
else
  echo "Column 1 font color = $F1 (${color[1]})"
fi

if [[ ${def_flag[2]} == 1 ]]; then
  echo "Column 2 background = default (green)"
else
  echo "Column 2 background = $BG2 (${color[2]})"
fi

if [[ ${def_flag[3]} == 1 ]]; then
  echo "Column 2 font color = default (blue)"
else
  echo "Column 2 font color = $F2 (${color[3]})"
fi
