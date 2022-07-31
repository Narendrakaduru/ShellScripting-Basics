#! /bin/bash

read -rp 'Enter Age to verify : ' age

if [ "$age" -eq 18 ] || [ "$age" -eq 30 ]
# you can also write this if as below
# if [ "$age" -gt 18 -o "$age" -le 30 ]
# if [[ "$age" -gt 18 || "$age" -le 30 ]]
    then
        echo "You are eligible to view this bash!"
    else
        echo "You are not eligible to view this bash!"
fi