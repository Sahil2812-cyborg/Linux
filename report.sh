#!/bin/bash

echo "INFO count: $(grep 'INFO' server.log|wc -l)"
echo "WARN count: $(grep 'WARN' server.log|wc -l)"
echo "ERROR count: $(grep 'ERROR' server.log|wc -l)"

top_user="$(grep 'Failed login' server.log | awk '{print $NF}'|sort|uniq -c|sort -nr|head -1|awk '{print $NF}')"

echo "User with most failed logins: $top_user"
