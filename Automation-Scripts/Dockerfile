FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    mysql-client \
    awscli \
    gzip \
    cron && \
    apt-get clean

# Add the scripts to the container
COPY backup_database.sh /backup_database.sh
COPY entrypoint.sh /entrypoint.sh

# Make the scripts executable
RUN chmod +x /backup_database.sh /entrypoint.sh

# Set environment variables
ENV BACKUP_PATH=/backups
ENV RETENTION_DAYS=7

# Create the backup directory
RUN mkdir -p /backups

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]