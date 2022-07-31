#! /bin/bash
# using read file content into one variable and print it
cat test | while read -r file_read
do
    echo "$file_read"
done