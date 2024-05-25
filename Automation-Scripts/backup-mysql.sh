#!/bin/bash

# Variables
CONTAINER_NAME="mysql_container"
BACKUP_PATH="./backups"
DATE=$(date +%F_%T)
BACKUP_FILE="$BACKUP_PATH/mysql_backup_$DATE.sql"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_PATH

# Run the mysqldump command inside the container
docker exec $CONTAINER_NAME /usr/bin/mysqldump -u root --password=root_password example_db > $BACKUP_FILE

# Check if the command succeeded
if [ $? -eq 0 ]; then
  echo "Backup successful: $BACKUP_FILE"
else
  echo "Backup failed"
fi