#! /bin/bash

n=1

while [ $n -le 3 ]
# this while can also be written as while (( $n <= 10 ))
do
    echo $n
    n=$(( n+1 ))
    gnome-terminal &
    # this can also be written as $(( ++n ))
done