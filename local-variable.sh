#! /bin/bash

function print () {
    local name=$1 # local keyword will accessable to only this function
    echo "The name is $name"
}

name="Tom" # executed first

echo "The name is $name : Before"
print Max
echo "The name is $name : After"