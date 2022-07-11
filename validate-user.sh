#! /bin/bash

read -rp 'Enter UserName : ' username

if [ "$username" == "nani" ]
then
    echo "Welcome $username"
else
    echo "Invalid User"
fi