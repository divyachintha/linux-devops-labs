#!/bin/bash

DATE=$(date +"%Y-%m-%d-%H-%M-%S")
echo "shell script for monitoring"
echo $DATE

touch report.txt

REPORT=report.txt

echo "Report Generated $DATE" >> $REPORT

echo "==== uptime ====" >>$REPORT
uptime >> $REPORT
echo "==== disk monitoring ====" >> $REPORT
df -h >> $REPORT
DISK_USAGE=$(df | awk 'NR==2 {print $5}'| sed 's/%//')
if [ $DISK_USAGE -gt 80 ]; then
	echo "WARNING: disk usage is high" >> $REPORT 
fi

echo "==== CPU USAGE ====" >> $REPORT
top -bn1 | grep "load average"  >> $REPORT

echo "===== TOP 5 PROCESSES =====" >> $REPORT
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6 >> $REPORT


