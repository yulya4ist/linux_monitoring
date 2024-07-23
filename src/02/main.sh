#!/bin/bash
#task2

#hostname
HOSTNAME=$(hostname)
echo "HOSTNAME = $HOSTNAME"

#timezone
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
UTC=$(date +%z)
echo "TIMEZONE = $TIMEZONE UTC $UTC"

#username
USER=$(whoami)
echo "USER = $USER"

#os
OS=$(lsb_release -a | grep Description | awk '{print $2, $3}')
echo "OS = $OS"

#date
DATE=$(date '+%d %b %Y %T')
echo "DATE = $DATE"

#uptime
UPTIME=$(uptime -p)
echo "UPTIME = $UPTIME"

#UPTIME_SEC
UPTIME_SEC=$(cat /proc/uptime | awk '{printf $1}')
echo "UPTIME_SEC = $UPTIME_SEC"

#ip
IP=$(ifconfig | grep 'broadcast' | awk '{print $2}')
echo "IP = $IP"

#MASK
MASK=$(ifconfig | grep 'broadcast' | awk '{print $4}')
echo "MASK = $MASK"

#GATEWAY
GATEWAY=$(ip route | grep 'default' | awk '{print $3}')
echo "GATEWAY = $GATEWAY"

RAM_TOTAL=$(free -h | grep -e 'Mem' | awk '{printf "%.3f GB", $2/1024}')
echo "RAM_TOTAL = $RAM_TOTAL"
RAM_USED=$(free -h | grep -e 'Mem' | awk '{printf "%.3f GB", $3/1024}')
echo "RAM_USED = $RAM_USED"
RAM_FREE=$(free -h | grep -e 'Mem' | awk '{printf "%.3f GB", $4/1024}')
echo "RAM_FREE = $RAM_FREE"

SPACE_ROOT=$(df -h / | awk '{print $2}' | tail -1)
echo "SPACE_ROOT: $SPACE_ROOT"
SPACE_ROOT_USED=$(df -h / | awk '{print $3}' | tail -1)
echo "SPACE_ROOT_USED: $SPACE_ROOT_USED"
SPACE_ROOT_FREE=$(df -h / | awk '{print $4}' | tail -1)
echo "SPACE_ROOT_FREE: $SPACE_ROOT_FREE"

chmod +x save_to_file.sh
bash save_to_file.sh "$HOSTNAME" "$TIMEZONE" "$USER" "$OS" "$DATE" "$UPTIME" "$UPTIME_SEC" "$IP" "$MASK" "$GATEWAY" "$RAM_TOTAL" "$RAM_USED" "$RAM_FREE" "$SPACE_ROOT" "$SPACE_ROOT_USED" "$SPACE_ROOT_FREE"






