#! /bin/bash

read -p 'Enter a Number : ' num1
read -p 'Enter Other Number : ' num2
sum=$(($num1+$num2))
echo "The sum of numbers is " $sum