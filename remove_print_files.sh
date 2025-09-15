#!/bin/bash

FILES_DIR='/usr/local/openspecimen/data/print-labels'
COUNT=0

for file in "$FILES_DIR"/*; do
    if [ -f "$file" ]; then
        mod_date=$(stat -c %Y "$file")
        current_date=$(date +%s)

        days=$(( (current_date - mod_date) / 86400 ))

        echo "$file is $days days old"

        # delete files older than 7 days
        if [ "$days" -gt 7 ]; then
            rm "$file"
            echo "Deleted $file"
            ((COUNT++))   # increment COUNT by 1
        fi
    fi
done

echo "Total $COUNT files removed"
