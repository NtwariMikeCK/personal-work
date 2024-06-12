#!/usr/bin/env bash

# File to store student records
student_file="students-list_0524.txt"

# Function to create a new student record
create_student() {
    echo "Enter student email:"
    read email
    if [[$email == *".com"]]; then
      continue
    else
	echo "Invalid email, must end with .com"
    fi
    echo "Enter student age:"
    read age
    echo "Enter student ID:"
    read student_id
    
    # Save student record in the file
    echo "$student_id,$email,$age" >> $student_file
    echo "Student record created successfully."
}

# Function to view all students
view_students() {
    if [[ -f $student_file ]]; then
        echo "List of all students:"
        cat $student_file
    else
        echo "No student records found."
    fi
}

# Function to delete a student record by student ID
delete_student() {
    echo "Enter student ID to delete:"
    read student_id
    
    if [[ -f $student_file ]]; then
        grep -v "^$student_id," $student_file > temp_file && mv temp_file $student_file
        echo "Student record deleted successfully."
    else
        echo "No student records found."
    fi
}

# Function to update a student record by student ID
update_student() {
    echo "Enter student ID to update:"
    read student_id
    
    if grep -q "^$student_id," $student_file; then
	 echo "What do you want to update?"
        echo "1. Email"
        echo "2. Age"
        echo "3. Course"
        echo "4. All"
        read -p "Enter your choice (1-4): " choice
     
        case "$choice" in
	   1)  read -p "Enter new student email: " new_email
	       awk -v id="$student_id" -v email="$new_email" -F ',''BEGIN {OFS = FS} 
	       $2 == email {$1 == id} 1' students-list_0524.txt > temp.txt && mv temp.txt students-list_0524.txt
	esac

        echo "Enter new email:"
        read new_email
        echo "Enter new age:"
        read new_age
        
        grep -v "^$student_id," $student_file > temp_file
        echo "$student_id,$new_email,$new_age" >> temp_file
        mv temp_file $student_file
        echo "Student record updated successfully."
    else
        echo "Student ID not found."
    fi
}

# Menu function
menu() {
    while true; do
        echo "-----------------------------"
        echo "ALU Registration System"
        echo "1. Create student record"
        echo "2. View all students"
        echo "3. Delete student record"
        echo "4. Update student record"
        echo "5. Exit"
        echo "-----------------------------"
        echo "Enter your choice:"
        read choice

        case $choice in
            1) create_student ;;
            2) view_students ;;
            3) delete_student ;;
            4) update_student ;;
            5) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid choice. Please try again." ;;
        esac
    done
}

# Start the menu
menu

