#!/bin/bash

LIMIT=200

if [ $# -ne 1 ]
then
  echo "Usage: sh plugins.sh domain.com" 
  exit
fi

if [ ! -e /usr/local/apache/domlogs/"$1" ]
then
  echo "The domain is not found in domlogs folder" 
  exit
fi

grep plugin /usr/local/apache/domlogs/"$1" | awk '{print $7}' | cut -d '/' -f4 | grep -v index.php | sort | uniq -c | awk '{ if ($1>"$LIMIT") print }'
