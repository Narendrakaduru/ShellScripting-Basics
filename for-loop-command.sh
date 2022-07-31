#! /bin/bash

for command in ls pwd date
do
    echo "-------------------$command------------------------"
    $command
done