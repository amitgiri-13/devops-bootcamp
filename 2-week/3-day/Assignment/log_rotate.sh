#!/bin/bash

LOG_DIR="/var/log/app_logs"
CURRENT_LOG="$LOG_DIR/app.log"
TIMESTAMP=$(date +"%Y-%M-%d")

# Rotate: move current log to timestamped file and compress
if [ -f "$CURRENT_LOG" ]; then
	mv "$CURRENT_LOG" "$CURRENT_LOG.$TIMESTAMP"
	gzip "$CURRENT_LOG.$TIMESTAMP"
fi

# Create a new empty log file
touch "$CURRENT_LOG"
chmod 660 "$CURRENT_LOG"

# Delete old compressed logs
find "$LOG_DIR" -name "*.gz" -mtime +30 -exec rm {} \;
 
