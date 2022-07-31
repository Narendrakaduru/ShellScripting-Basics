#! /bin/bash

select name in nani karthik harish prathap
do
    case $name in
        nani )
            echo "nani Selected" ;;
        
        karthik )
            echo "karthik Selected" ;;

        harish )
            echo "harish Selected" ;;

        prathap )
            echo "prathap Selected" ;;

        * )
            echo "Please select input from the list"
    esac
done