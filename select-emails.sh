#!/usr/bin/env bash
#file that contains students records

student_file="students-list_0524.txt"

# Output file for student emails
output_file="student-emails.txt"

# Extract emails and save them to the output file
awk -F, '{print $2}' $student_file > $output_file
echo "Student emails saved to $output_file."
