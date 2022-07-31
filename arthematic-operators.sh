#! /bin/bash

read -rp 'Enter a Number : ' num1
read -rp 'Enter another Number : ' num2
echo ---------------------------------------
echo The addition of Numbers is: $(( num1 + num2 ))
echo The subtraction of Numbers is: $(( num1 - num2 ))
echo The multiplication of Numbers is: $(( num1 * num2 ))
echo The division of Numbers is: $(( num1 / num2 ))
echo The modulus of Numbers is: $(( num1 % num2 ))
echo ---------------------------------------
# it can also be done as below
echo "$(expr $num1 + $num2)"
echo "$(expr $num1 - $num2)"
echo "$(expr $num1 \* $num2)" # use back slash to escape character if *
echo "$(expr $num1 / $num2)"
echo "$(expr $num1 % $num2)"