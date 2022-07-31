#! /bin/bash
# using input redirection
while read -r file_read
do
    echo "$file_read"
done < test