#! /bin/bash

echo -e "Enter the Name of the file : \c" # -e is for file exists or not
read -r file_name

if [ -f "$file_name" ] 

# -f is for file exists or not and it is a regular file or not
# -d is for directory exists or not
# -b is for checking whether it is a block special file such as images or videos etc..
# -c is for checking whether it is a character special file or not such as text file or not

then
    if [ -w "$file_name" ] 
    
    # to check whether the file has write permission or not
    # -r to check whether the file has read permission or not
    # -x to check whether the file has execute permission or not
    
    then
        if [ -s "$file_name" ] # checks whether file is empty or not
        then
            echo "Append Some Data to File, Press ctrl + d to EXIT"
            cat >> "$file_name"
        else
            echo "Enter Some New Data to File, Press ctrl + d to EXIT"
            cat > "$file_name"
        fi  
    else
        echo "The File do not have Write Permission"
    fi
else
    echo "$file_name File does not exists!"
fi