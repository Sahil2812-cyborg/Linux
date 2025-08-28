#!/bin/bash

#server access analyzer
#script to analyze  top requests and errors
#Autho: Sahil

LOG_FILE="access.log"
REPORT_FILE="network_analysis.txt"

echo "Analyzing the data from $LOG_FILE"
echo "top 3 IPs:">> "$REPORT_FILE"
awk '{print $1}' access.log | sort | uniq -c | sort -nr | awk '{print $2}' | head -3>> "$REPORT_FILE"

echo "top 3 Urls">> "$REPORT_FILE"
awk '{print $7}' access.log | sort |uniq -c |sort -nr|awk '{print $2}'| head -3>> "$REPORT_FILE"


echo "Count of 404 Errors">> "$REPORT_FILE"
grep '404' access.log | wc -l>> "$REPORT_FILE"

echo "Report saved to $REPORT_FILE"


