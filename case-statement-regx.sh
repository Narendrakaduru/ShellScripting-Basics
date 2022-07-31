#! /bin/bash

echo -e "Enter a Character to Validate REGX : \c"
read -r value

case $value in

    [a-z] )
        echo "The entered character $value is between a to z" ;;
    
    [A-Z] )
        echo "The entered character $value is between A to Z" ;;

    [0-9] )
        echo "The entered character $value is between 0 to 9" ;;

    ? )
        echo "The entered character $value is a special character" ;;

    * )
        echo "unknown input" ;;
        
esac