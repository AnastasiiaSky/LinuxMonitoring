#! /bin/bash

symbols="^[+-]?[0-9]+([.][0-9]+)?$"

if [ -n "$1" ]
then 
  if [ -n "$2" ]
  then
    echo "Too much parameters. "
  else
    if [[ $1 =~ $symbols ]]
    then
       echo "Wrong parameters. String expected. "
    else
    echo $1
    fi
  fi
else 
  echo "No paranetrs found. "
fi