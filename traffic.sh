#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Usage: sh traffic.sh 04/Jan/2015:10:10"
  exit
fi

arg=$(echo "$1" | awk 'BEGIN{FS="[/:]"}{print NF}')

if [ "$arg" -ne 5 ]
then
  echo "Usage: sh traffic.sh 04/Jan/2015:10:10"
  echo "Do not input seconds!"
  exit
fi

for d in $(awk '{print $1}' /etc/userdomains | cut -d: -f1) 
do
  if [ "$d" == "*" ]
  then
    continue
  fi

  if [ -e /usr/local/apache/domlogs/"$d" ]
  then
    total=$(grep -c "$1" /usr/local/apache/domlogs/"$d") 
    if [ "$total" -ne 0 ]
    then
      echo "${d} – ${total}"
    fi
  fi
done
