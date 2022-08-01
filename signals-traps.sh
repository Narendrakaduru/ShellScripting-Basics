#! /bin/bash

file=/home/$USER/scripts/newfile.txt

trap "touch $file && echo File Created here!; exit" 0 2 15

echo "The PID of this running script is $$"

# set -x # start debugging

while (( COUNT < 10 ))
do
    sleep 2
    (( COUNT ++ ))
    echo "$COUNT"
done

# set +x # stop debugging

exit 0