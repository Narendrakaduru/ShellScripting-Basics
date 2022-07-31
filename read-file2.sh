#! /bin/bash
# using input redirection
while IFS=' ' read -r file_read
do
    echo "$file_read"
done < /etc/host.conf