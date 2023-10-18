#! bin/bash

HOSTNAME=`hostname`
TIMEZONE="$(cat /etc/timezone) $(date -u "+%Z") $(date "+%z")"
USER=$(whoami)
OS=`cat /etc/issue | awk '{print $1,$2,$3}' | tr -s '\r\n' ' '`
DATE=$(date "+%d %b %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(ip addr show | grep "dynamic enp0s3" | awk '{print $2}')
MASK=$(ifconfig | grep -m1 netmask | awk '{print $4}')
GATEWAY=$(ip route | grep default | awk '{print $3}')
RAM_TOTAL=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
RAM_USED=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
RAM_FREE=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
SPACE_ROOT=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')

function print {
    echo "HOSTNAME: = $HOSTNAME"
    echo "TIMEZONE= $TIMEZONE"
    echo "USER= $USER"
    echo "OS= $OS"
    echo "DATE= $DATE"
    echo "UPTIME= $UPTIME"
    echo "UPTIME_SEC= $UPTIME_SEC"
    echo "IP= $IP"
    echo "MASK= $MASK"
    echo "GATEWAY= $GATEWAY"
    echo "RAM_TOTAL= $RAM_TOTAL"
    echo "RAM_USED= $RAM_USED"
    echo "RAM_FREE= $RAM_FREE"
    echo "SPACE_ROOT= $SPACE_ROOT"
    echo "SPACE_ROOT_USED= $SPACE_ROOT_USED"
    echo "SPACE_ROOT_FREE= $SPACE_ROOT_FREE"
}
function saving {
  read -p "Do you want to save data into file? (Y/N): " user_answer
}
