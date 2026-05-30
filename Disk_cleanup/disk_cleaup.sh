#!/bin/bash

LOG_DIR="/var/log"

find $LOG_DIR  -name "*.log" -size +100M

find $LOG_DIR -type f -name "*.log" -mtime +10 -exec gzip {} \;

find $LOG_DIR -type f -name "*.log" -mtime +30 -delete

echo "cleanup comapleted"
