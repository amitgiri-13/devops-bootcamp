# Task 1: Log Rotation and Cleanup Description

1. **You need to implement a log rotation system on your server where logs older than 30 days are deleted, and a new log file is created every day. This should be applied to application logs in /var/log/app_logs/.**

```bash
Requirements:

    - Create a script that checks for log files older than 30 days and removes them.

    - Ensure that a new log file is created every day with a timestamp.

    - Ensure that logs are compressed for archival
```

- **Script**
```bash
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
```

- **Cron job**
```bash
sudo crontab -e

# Run script daily at 9 PM
0 21 * * * /path/to/script
```

---
