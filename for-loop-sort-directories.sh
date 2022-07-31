#! /bin/bash
# check every file and directory in the PWD and get only Directories
for item in *
do
    if [ -d "$item" ]
    then
        echo "$item"
    fi
done