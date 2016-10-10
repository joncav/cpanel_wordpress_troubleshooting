#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Usage: sh hits.sh 04/Aug/2013:10:00:52"
  exit
fi

for d in $(awk '{print $1}' /etc/userdomains | cut -d: -f1 | sed '/*/d') 
do
  if [ "$d" == "*" ]
  then
    continue
  fi

  if [ -e /usr/local/apache/domlogs/"$d" ]
  then
    grep "$1" /usr/local/apache/domlogs/"$d"
    if [ $? -eq 0 ]
    then
       echo -e "$d\n\n"
    fi
  fi
done
