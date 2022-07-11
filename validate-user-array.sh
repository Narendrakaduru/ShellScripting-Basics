#! /bin/bash

users=("hari" "bhanu" "ravi" "raju" "rehman" "mani")

# echo ${users[@]}

read -p 'Enter Username : ' entereduser

foreach $entereduser ( * )
do
if [[ $entereduser = ${users[@]} ]]
then
    echo "Valid User"
else
    echo "Invalid User"
fi
done