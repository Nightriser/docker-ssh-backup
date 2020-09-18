#!/bin/ash
# This script will generate the SSH-Keys and create the 
# configuration file for the backup script

# Version:	1
# Date:		2020-09-18
# Creator:	Nightriser

# Changelog:
# 2020-09-18: Initial Creation

# ToDo:
# Error Detection and Error Correction for user input
# Error detection for ssh-connection



# Create SSH folder
/bin/mkdir /root/.ssh

# Create SSH Keys with 4096 bits (takes way longer with 8192)
/usr/bin/ssh-keygen -b 4096 -t rsa -N '' -f /root/.ssh/id_rsa

# Require user input for the following variables: hostip, user, ssh-port, sourcedevice
echo "Enter IP of the host you want to backup: "
read hostip
echo "Enter username of a user with ssh and sudo rights: "
read user
echo "Enter SSH-Port: "
read ssh-port
echo "Enter remote device to backup: "
read sourcedevice
echo "Enter pigz compression level (4 recommended): "
read compression
echo "Enter full hour to start backup [0-23]"
read hour

# Copy the created SSH-Key to the remote machine
echo "Copying the ssh-key to the remote machine. You will be prompted for a password."
/usr/bin/ssh-copy-id "$user"@"$hostip"

# Echo all the variables to the configuration file
echo "Writing variables to configuration file /root/backup.conf"
echo hostip="$hostip" > /root/backup.conf
echo user="$user" > /root/backup.conf
echo ssh-port="$ssh-port" > /root/backup.conf
echo sourcedevice="$sourcedevice" > /root/backup.conf
echo compression="$compression" > /root/backup.conf

# Create the cronjob
echo "Creating the cronjob"
echo "0 $hour * * * /root/backup.sh" >> /etc/crontabs/root

echo "Script finished. Have a nice day! Don't forget to restart the container!"