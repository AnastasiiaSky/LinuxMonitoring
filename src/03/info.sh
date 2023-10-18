#! bin/bash

HOSTNAME=`hostname`
TIMEZONE="$(timedatectl set-timezone Europe/Moscow) $(cat /etc/timezone) $(date -u "+%Z %z")"
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
    echo -e "${left_back_color}${left_text_color}HOSTNAME${default_colors} = ${right_back_color}${right_text_color}$HOSTNAME${default_colors}"
    echo -e "${left_back_color}${left_text_color}TIMEZONE${default_colors} = ${right_back_color}${right_text_color}${right_back_color}${right_text_color}$TIMEZONE${default_colors}"
    echo -e "${left_back_color}${left_text_color}USER${default_colors} = ${right_back_color}${right_text_color}$USER${default_colors}"
    echo -e "${left_back_color}${left_text_color}OS${default_colors} = ${right_back_color}${right_text_color}$OS${default_colors}"
    echo -e "${left_back_color}${left_text_color}DATE${default_colors} = ${right_back_color}${right_text_color}$DATE${default_colors}"
    echo -e "${left_back_color}${left_text_color}UPTIME${default_colors} = ${right_back_color}${right_text_color}$UPTIME${default_colors}"
    echo -e "${left_back_color}${left_text_color}UPTIME_SEC${default_colors} = ${right_back_color}${right_text_color}$UPTIME_SEC${default_colors}"
    echo -e "${left_back_color}${left_text_color}IP${default_colors} = ${right_back_color}${right_text_color}$IP${default_colors}"
    echo -e "${left_back_color}${left_text_color}MASK${default_colors} = ${right_back_color}${right_text_color}$MASK${default_colors}"
    echo -e "${left_back_color}${left_text_color}GATEWAY${default_colors} = ${right_back_color}${right_text_color}$GATEWAY${default_colors}"
    echo -e "${left_back_color}${left_text_color}RAM_TOTAL${default_colors} = ${right_back_color}${right_text_color}$RAM_TOTAL${default_colors}"
    echo -e "${left_back_color}${left_text_color}RAM_USED${default_colors} = ${right_back_color}${right_text_color}$RAM_USED${default_colors}"
    echo -e "${left_back_color}${left_text_color}RAM_FREE${default_colors} = ${right_back_color}${right_text_color}$RAM_FREE${default_colors}"
    echo -e "${left_back_color}${left_text_color}SPACE_ROOT${default_colors} = ${right_back_color}${right_text_color}$SPACE_ROOT${default_colors}"
    echo -e "${left_back_color}${left_text_color}SPACE_ROOT_USED${default_colors} = ${right_back_color}${right_text_color}$SPACE_ROOT_USED${default_colors}"
    echo -e "${left_back_color}${left_text_color}SPACE_ROOT_FREE${default_colors} = ${right_back_color}${right_text_color}$SPACE_ROOT_FREE${default_colors}"
}


function set_colour {
    result_colour=0

    case "$1" in
        1) result_colour=7 ;;
        2) result_colour=1 ;;
        3) result_colour=2 ;;
        4) result_colour=4 ;;
        5) result_colour=5 ;;
        6) result_colour=0 ;;
    esac
return $result_colour
}

function nopar_print {
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
    echo -e "SPACE_ROOT_FREE= $SPACE_ROOT_FREE\n\n\n"
}
