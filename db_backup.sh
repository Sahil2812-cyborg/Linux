#! /bin/bash

#Takes OS db backup everyday and will delete backups older than 5 days.
#Author: Sahil
#Date: 02/08/2025

HOST='localhost'
USER='root'
PASSWD='root'
DATABASE='openspecimen'

DAYS_TO_KEEP=5
DATE=$(date +%d-%m-%y)

BACKUP_FILE="OPENSPECIMEN_$DATE.sql.gz"



echo "Initializing database backup"

mysqldump -h $HOST -u $USER -p$PASSWD --skip-lock-tables --routines --set-gtid-purged=OFF --triggers --no-tablespaces $DATABASE | gzip > $BACKUP_FILE


find "/home/sahil/Desktop/linux_assignment" -type f -name "*.sql.gz" -mtime +$DAYS_TO_KEEP -delete;

echo "cleanup completed"



