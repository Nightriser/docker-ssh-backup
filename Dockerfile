# Dockerfile for this container

# Version:	1
# Date:		2020-09-18
# Creator:	Nightriser

# Changelog:
# 2020-09-18: Initial Creation



# Always use most recent alpine image ;)
FROM alpine:latest

# Update package lists and download openssh-client
RUN apk update && apk upgrade && apk add --no-cache openssh-client

# Add the init.sh script to the container and make it executable
ADD ./init.sh /root/
RUN chmod +x /root/init.sh

# Add the backup.sh script to the container and make it executable
ADD ./backup.sh /root/
RUN chmod +x /root/backup.sh

# Add the entry.sh script to the container and make it executable
ADD ./entry.sh /root/
RUN chmod +x /root/entry.sh


# Run the cron daemon when the container starts
CMD ["/root/entry.sh"]