


#!/bin/bash
#failed login tracker
#script to analyze failed SSH login attempts and report suspicious ips
#Author: Sahil


LOG_FILE="auth.log"
FAILED_FILE="failed_report.txt"
BLOCKED_FILE="blocked_ips.txt"
THRESHOLD=3

echo "Analyzing failed SSH logins from $LOG_FILE"

grep -i "Failed password" "$LOG_FILE" > temp_failed.log
awk '{print $(NF-3)}' temp_failed.log | sort | uniq -c | sort -nr > "$FAILED_FILE"

echo "IPs with more than $THRESHOLD failed attempts:" > "$BLOCKED_FILE"
awk -v threshold=$THRESHOLD '$1 > threshold {print $2}' "$FAILED_FILE" >> "$BLOCKED_FILE"

rm temp_failed.log

echo "Report saved to $FAILED_FILE"
echo "Suspicious IPs saved to $BLOCKED_FILE"
cat "$BLOCKED_FILE"
