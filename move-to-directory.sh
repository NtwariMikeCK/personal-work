#!/usr/bin/env bash
# create the directory to keep our codes
directory_name="negpod_15-q1"

# Create the directory if it doesn't exist
if [ ! -d "$directory_name" ]; then
  mkdir "$directory_name"
fi

# Move the files to the directory
mv main.sh "$directory_name/"
mv students-list_0524.txt "$directory_name/"
mv select-emails.sh "$directory_name/"
mv student-emails.txt "$directory_name/"

echo "Files moved to $directory_name."
