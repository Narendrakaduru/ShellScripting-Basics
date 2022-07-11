#! /bin/bash

echo -e "Enter the Name of the File : \c"

read -r file_name


# -e is for file exists or not 
# -f is for if it is a Regular file or not
if [ -e "$file_name" ]
then
    echo "$file_name File Found Here!!"
else
    echo "$file_name File Not Found Here!!"
fi