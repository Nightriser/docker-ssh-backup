#!/bin/bash
# Build script for this container

# Version:	1
# Date:		2020-09-18
# Creator:	Nightriser

# Changelog:
# 2020-09-18: Initial Creation

# ToDo:

# Current Version of the repository
version=v0.5

# Change directory to the freshly downloaded Repository
cd ./docker-ssh-backup

# Build the container
docker build -t "nightriser/ssh-backup:$version" .