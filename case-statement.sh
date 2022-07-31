#! /bin/bash

vehicle=$1

case $vehicle in

    "car" )
        echo "The rent of the car is 100 Dollor" ;;
    
    "van" )
        echo "The rent of the van is 120 Dollor" ;;

    "bike" )
        echo "The rent of the bike is 50 Dollor" ;;

    "bicycle" )
        echo "The rent of the bicycle is 10 Dollor" ;;

    * )
        echo "unknown vehicle" ;;
        
esac