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
if grep -rn "$string" "$FULL_PATH" 2>/dev/null; then
    echo "----------------------------------------"
    echo "Search completed successfully."
else
    echo "No occurrences of '$string' found in any files in '$FULL_PATH'"
fi
