#!/bin/ash
# This script does the actual work of creating the backup

# Version:	1
# Date:		2020-09-18
# Creator:	Nightriser

# Changelog:
# 2020-09-18: Initial Creation

# ToDo:
# Use some sort of logic for creating weekly, monthly, yearly backups with longer retention
# Customizable filenames?



# Source the backup.conf file
. /root/backup.conf

# Initialize two additional variables: filename (current date + fileextension) and destination
filename=`date "+%F"`".img.gz"
destination=/backup

# Create the backup with the sourced variables
/usr/bin/ssh -p "$ssh-port" "$user"@"$hostip" sudo dd if="$sourcedevice" bs=4M | /usr/bin/pigz -"$compression" > "$destination"/"$filename"