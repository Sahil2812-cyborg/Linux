#!/bin/bash
#Search for a file and text present in that file
#Author: Sahil
#Date: 30/07/2025

echo "Welcome to the text finder"
read -p "Enter the directory name (will search in /home/sahil/): " directory
read -p "Enter the string to search: " string

# Construct the full path
FULL_PATH="/home/sahil/$directory"

# Check if directory exists
if [ ! -d "$FULL_PATH" ]; then
    echo "Error: Directory '$FULL_PATH' does not exist!"
    exit 1
fi

echo "Searching for '$string' in directory: $FULL_PATH"
echo "----------------------------------------"

# Search for the text in all files in the directory
# Search through each file and count occurrences
for file in $(find "$FULL_PATH" -type f); do
    count=$(grep -o "$string" "$file" 2>/dev/null | wc -l)
    echo "$file : $count"
done

echo "----------------------------------------"
echo "Search completed successfully."
