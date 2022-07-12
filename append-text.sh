#! /bin/bash

echo -e "Enter the Name of the file : \c"
read -r file_name

if [ -f "$file_name" ]
then
    if [ -w "$file_name" ]
    then
        if [ -s "$file_name" ]
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