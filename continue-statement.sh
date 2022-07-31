#! /bin/bash

for (( i=0; i<=10; i++ ))
do
    if [ "$i" -eq 3 ] || [ "$i" -eq 6 ]
    then
        continue
    fi
    echo "$i"
done