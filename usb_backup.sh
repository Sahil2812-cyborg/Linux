#!/bin/bash

# Configuration - CHANGE THESE VALUES
USB_LABEL="CHITALE"
SOURCE_FOLDER="$HOME/Desktop/test_folder"
BACKUP_NAME="DocumentsBackup"

echo "Looking for USB drive: $USB_LABEL"

# Show available drives for debugging
echo "Available mounted drives:"
for mount in /media/$USER/* /mnt/* ; do
    if [ -d "$mount" ]; then
        echo "  - $(basename "$mount") at $mount"
    fi
done

# Find USB drive
USB_PATH=""
for mount in /media/$USER/* /mnt/* ; do
    if [ -d "$mount" ] && [ "$(basename "$mount")" = "$USB_LABEL" ]; then
        USB_PATH="$mount"
        break
    fi
done

# Check if USB found
if [ -z "$USB_PATH" ]; then
    echo "USB drive '$USB_LABEL' not found!"
    echo "Make sure the USB drive label matches exactly (case-sensitive)"
    exit 1
fi

echo "Found USB at: $USB_PATH"
BACKUP_PATH="$USB_PATH/$BACKUP_NAME"

# Check if backup exists and is newer than source
if [ -d "$BACKUP_PATH" ] && [ "$BACKUP_PATH" -nt "$SOURCE_FOLDER" ]; then
    echo "Backup is up-to-date. Nothing to do."
    exit 0
fi

# Perform backup
echo "Starting backup..."
echo "Removing old backup"
rm -rf "$BACKUP_PATH"  # Remove old backup
echo "creating new backup"
cp -rv "$SOURCE_FOLDER" "$BACKUP_PATH"

if [ $? -eq 0 ]; then
    echo "Backup completed successfully!"
else
    echo "Backup failed!"
    exit 1
fi
