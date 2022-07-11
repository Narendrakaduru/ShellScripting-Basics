#! /bin/bash

echo "Enter Student Names : "
read -a students
echo "Enter Student Marks : "
read -a marks
echo "Enterd Students Are : ${students[*]}" 
echo "Entered Students Marks Are : ${marks[*]}"