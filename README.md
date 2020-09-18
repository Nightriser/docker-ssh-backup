# docker-ssh-backup
 Backup a Linux Machine via SSH, dd and pigz



## About

This will backup a UNIX/Linux machine or anything with a ssh-server, dd and root-access/sudo.

The Backup will be created daily.


## Installation

Clone this repository

	git clone docker-ssh-backup

Create the container

	./docker-ssh-backup/build.sh

Run the container

	docker run -dit \
	--name backup
	-v /path/to/folder:/backup
	nightriser/ssh-backup:v0.1

> Replace `/path/to/folder` with the path to the folder you want the backups to end up in.
> Change the container name if you want to

Create the backup-task (ssh-keygen, ssh-copy-id and cronjob)

	docker exec -it backup /root/init.sh

## Changelog
#### 2020-09-18: v0.1
Initial Creation of the Repository<br>
Added: License, build.sh, Dockerfile, init.sh, backup.sh<br>