#! /bin/bash

echo -e "Enter the Name of the File : \c"

read -r file_name


# -e is for file exists or not 
# -f is for if it is a Regular file or not
# -d is for checking Directory exists or not
# -b for Block Special file(Images Videos binaryfiles)
# -c for character special files(normal text files)
# -s to check whether file is Empty or Not
# -r for read -w for write and -x for Execute Checks the file has certain permissions
if [ -e "$file_name" ]
then
    echo "$file_name File Found Here!!"
else
    echo "$file_name File Not Found Here!!"
fi