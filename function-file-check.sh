#! /bin/bash
usage() {
    echo "You need to Enter Argument : "
    echo "usage $0 file_name"
}
is_file_exists() {
    local file="$1"
    [[ -f "$file" ]] && return 0 || return 1
}

[[ $# -eq 0 ]] && usage
if ( is_file_exists "$1" ) 
then
   echo 'File Found'
else
   echo 'File not Found'
fi