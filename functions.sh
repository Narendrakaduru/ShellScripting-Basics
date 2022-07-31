#! /bin/bash

name=Nani
function Hello () {
    echo "Hello $name"
}

function quit () {
    exit
}

function print() {
    echo "$1"
}

Hello
echo "Im printed after Hello function"
print Hai_Harish # passing arguments to a function
print Hai_Narendra
print Hai_Karthik
quit