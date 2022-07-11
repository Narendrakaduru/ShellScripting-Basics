#! /bin/bash

echo "Enter Student Names : "
read -ra students
echo "Enter Student Marks : "
read -ra marks
echo "Enterd Students Are : ${students[*]}" 
echo "Entered Students Marks Are : ${marks[*]}"