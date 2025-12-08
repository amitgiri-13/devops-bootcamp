# Task 1: Track The Most CPU Consuming Process

1. **Write a script that:**
```bash
    - Identifies the PID using the most CPU
    - Logs its PID, process name, and CPU usage to cpu_report.txt
```

- Commands

1. Create a script file.
```bash
vim generate_cpu_usage_report.sh
```

2. Write the script.
```bash
#!/bin/bash

# Report file
REPORT_FILE="cpu_report.txt"

# Creating report file if not exist
if ! [ -e $REPORT_FILE ] 
then
	echo "File $REPORT_FILE does not exist."
	echo 
	echo "Creating $REPORT_FILE ..."
	touch $REPORT_FILE
	echo "$REPORT_FILE created"
	echo 
fi

# Current date
DATE=$(date "+%Y-%m-%d %H:%M")

# Appending current date to report file
echo "" >> $REPORT_FILE
echo "Date: $DATE" >> $REPORT_FILE


# Generating report and filtering 
REPORT=$(ps aux --sort=-%cpu | head -n 2 | gawk '{print $2 "\t" $3 "\t" $11}')

# or 
#REPORT=$(ps -eo pid,%cpu,cmd --sort=-%cpu | head -n 2)

# Appending report to report file
echo "$REPORT" >> "$REPORT_FILE"	# If REPORT variable is not quoted bash removes new line


echo "View report in $REPORT_FILE dated $DATE."
```

3. Make the script executable.
```bash
chmod u+x generate_cpu_usage_report.sh
```

4. Execute the script.
```bash
./generate_cpu_usage_report.sh
```

5. View report.
```bash
cat cpu_report.txt
```

- Output

![alt text](images/task1.png)

---
