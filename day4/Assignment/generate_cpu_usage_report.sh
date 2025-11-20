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


