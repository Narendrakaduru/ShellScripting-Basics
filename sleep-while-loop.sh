#! /bin/bash

n=1

while [ $n -le 10 ]
# this while can also be written as while (( $n <= 10 ))
do
    echo $n
    n=$(( n+1 ))
    # this can also be written as $(( ++n ))
    sleep 1
    
done