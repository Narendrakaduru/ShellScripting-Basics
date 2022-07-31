#! /bin/bash

os=("ubuntu" "windows" "mac" "kali")
os[4]="mint" # to add an element to an array
echo ----------------------------------------------------------------
echo All the elements of the array are : "${os[@]}"
echo The at the index 1 of the array is : "${os[1]}"
echo The Indexes of the array are : "${!os[@]}"
echo The Length of the array is : "${#os[@]}"
echo ----------------------------------------------------------------
unset 'os[4]' # to delete an element from an array
echo All the elements of the array are : "${os[@]}"
echo The at the index 1 of the array is : "${os[1]}"
echo The Indexes of the array are : "${!os[@]}"
echo The Length of the array is : "${#os[@]}"


string=narendrakaduru

echo print string "${string[@]}"
echo print string "${string[0]}"
echo print string is empty "${string[1]}"
echo The length of the string array is "${#string[@]}"
echo The length of the string array is "${#string[0]}"
echo The length of the string array is "${#string[1]}"
# string will be placed at the index 0 position