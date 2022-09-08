#!/bin/bash
LINK="http://$1/"
echo "curling $LINK" 
for (( ;; )) 
do
    echo "\n"
    curl $LINK
    sleep 1
done
