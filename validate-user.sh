#! /bin/bash

read -p 'Enter UserName : ' username

if [ "$username" == "nani" ]
then
    echo "Welcome $username"
else
    echo "Invalid User"
fi