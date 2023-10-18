#! /bin/bash
. ./info.sh

start=`date +%s`

if [[ -n $1 ]]
then
    if [[ -d $1 ]]
    then
        if [[ ${1: -1} = "/" ]]
        then
            total_folders $1
            five_large_folders $1
            count_files $1
            print_files_by_type $1
            print_top_ten_files $1
            print_top_ten_exec_files $1
            print_time $start
        else
            echo "Directory should end with '/'"
        fi
    else
        echo "Directory not exist"
    fi
else
    echo "Parameter not faund. Try again."
fi