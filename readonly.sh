#! /bin/bash

readonly var=30

var=50 # this gives an error because the var is assigned to 30 and it is readonly

echo " the var is $var"

function hello () {
    echo "Hello"
}

readonly -f hello # assigning readonly to a function so this function cannot be declared again

function hello () {
    echo "Hello"
}

# readonly -p is used to check variables in the machine and print them
# readonly -f is used to check functions in the machine and print them