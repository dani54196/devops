#!/bin/bash

# Configuration from environment variables
DB_NAME=${DB_NAME}
DB_USER=${DB_USER}
DB_PASSWORD=${DB_PASSWORD}
DB_HOST=${DB_HOST:-localhost}
BACKUP_PATH=${BACKUP_PATH:-/backups}
S3_BUCKET=${S3_BUCKET}
RETENTION_DAYS=${RETENTION_DAYS:-7}
DATE=$(date +"%Y%m%d%H%M")

# Create a backup
echo "Creating backup of database $DB_NAME..."
mysqldump -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_PATH/$DB_NAME-$DATE.sql

# Compress the backup
echo "Compressing the backup..."
gzip $BACKUP_PATH/$DB_NAME-$DATE.sql

# Upload the backup to S3
echo "Uploading the backup to S3..."
aws s3 cp $BACKUP_PATH/$DB_NAME-$DATE.sql.gz s3://$S3_BUCKET/

# Remove local backups older than RETENTION_DAYS
echo "Removing local backups older than $RETENTION_DAYS days..."
find $BACKUP_PATH -type f -name "*.gz" -mtime +$RETENTION_DAYS -exec rm {} \;

# Optionally, remove old backups from S3
echo "Removing backups from S3 older than $RETENTION_DAYS days..."
aws s3 ls s3://$S3_BUCKET/ | grep "PRE" | while read -r line; do
    file=$(echo $line | awk '{print $4}')
    file_date=$(echo $file | awk -F'[-.]' '{print $2}')
    file_date_epoch=$(date -d $file_date +"%s")
    current_date_epoch=$(date +"%s")
    diff_days=$(( (current_date_epoch - file_date_epoch) / 86400 ))
    if [ $diff_days -gt $RETENTION_DAYS ]; then
        aws s3 rm s3://$S3_BUCKET/$file
    fi
done

echo "Backup process completed successfully."
