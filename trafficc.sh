#!/bin/bash

if [ $# -ne 2 ]
then
  echo "Usage: sh traffcc.sh domain.com 09/Jan/2015"
  exit
fi

if [ ! -e /usr/local/apache/domlogs/"$1" ]
then
  echo "Domain is not found in domlogs folder"
  exit
fi

for h in $(seq -w 0 23)
do
  echo -n "Date: $2, hour: $h, site requests: "
  grep "${2}:${h}:" /usr/local/apache/domlogs/"$1" | wc -l 
done
