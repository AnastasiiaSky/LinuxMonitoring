#! /bin/bash

source ./info.sh

if [[ -n $1 ]]
then
if [[ -n $5 ]]
then
   nopar_print
   echo -e "ERROR!\nToo many parametrs!\nUse 4 or few parametrs to color your text\n\n"
elif [[ -n $4 ]]
then
   parametr="^[1-6]$"
   if [[ $1 =~ $parametr ]] || [[ $2 =~ $parametr ]] || [[ $3 =~ $parametr ]] || [[ $4 =~ $parametr ]]
   then 
        if [[ $1 == $2 ]] || [[ $3 == $4 ]]
        then 
           nopar_print
           echo -e "ERROR!\nParameter 1 can't be equal parameter 2, as 3 can't be equal 4,\nbecouse it will not show text to you!\nChoose another parametrs.\n\n"
        else
            set_colour $1
            left_back_color="\033[4$?m"
            set_colour $2
            left_text_color="\033[3$?m"
            set_colour $3
            right_back_color="\033[4$?m"
            set_colour $4
            right_text_color="\033[3$?m"
            default_colors="\033[37m\033[0m"

            print
        fi
    else 
        nopar_print
        echo -e "ERROR!\nWrong parametrs.\nUse numbers 1-6 to choose colour.\n1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black\n\n"
        fi
    fi
else 
    nopar_print
    echo -e "ERROR\nNo paranetrs found!\nUse 4 numbers from 1 to six to color your text!\n\n"
    
fi   