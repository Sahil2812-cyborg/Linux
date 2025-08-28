#!/bin/bash

# Service Monitor
# Checks if MySQL is running; if not restarts it and logs it
# Author: Sahil

LOG_FILE="mysql.log"

echo "Checking MySQL Status"

if systemctl is-active --quiet mysql; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] MySQL is running" >> "$LOG_FILE"
    echo "MySQL is running"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] MySQL is down, attempting to restart service" >> "$LOG_FILE"
    echo "MySQL is down, attempting to restart service"
    
    sudo service mysql restart
    
    if systemctl is-active --quiet mysql; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] MySQL restarted successfully" >> "$LOG_FILE"
        echo "MySQL restarted successfully"
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] MySQL restart failed" >> "$LOG_FILE"
        echo "MySQL restart failed"
    fi
fi
