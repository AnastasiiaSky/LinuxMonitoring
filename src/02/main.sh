#! /bin/bash

source ./info.sh
if [ $# != 0]
  then
     echo "Error!"
else
    print
    saving

    if [[ $user_answer = "Y" ]]
     then
      date=$(date "+%d_%m_%y_%H_%M_%S")
      file_name="$date.status"
      print >> $file_name
      echo "New file $file_name successfully create!"
      elif [[ $user_answer = "y" ]]
       then
        date=$(date "+%d_%m_%y_%H_%M_%S")
        file_name="$date.status"
        print >> $file_name
        echo "New file $file_name successfully create!"
else
    echo "Your file not save. Use "Y/y" to save file"
    fi
fi