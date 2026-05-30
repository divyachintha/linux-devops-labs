#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="backups"
LOG_FILE="logs/backup.log"

mkdir $BACKUP_DIR logs

tar -cvzf $BACKUP_DIR/etc_backup_$DATE.tar.gz /etc
echo "$(date) : Backup completed" >> $LOG_FILE


find $BACKUP_DIR -type f -mtime +7 -delete
echo "Old backups deleted"
