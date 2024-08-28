#!/bin/bash

# Variables
BACKUP_SRC="/tmp"
BACKUP_DST="/backups"
BACKUP_DATE=$(date +%Y%m%d%H%M%S)
BACKUP_FILENAME="backup_$BACKUP_DATE.tar.gz"

mkdir -p "$BACKUP_DST/$BACKUP_DATE"

# Archive the src dir
tar -czf "$BACKUP_DST/$BACKUP_DATE/$BACKUP_FILENAME" "$BACKUP_SRC"

# Verify if backup succeded
if [ $? -eq 0 ]; then
	echo "Backup successful: $BACKUP_FILENAME"
else
	echo "Backup failed"
fi
