#!/bin/bash
set -e

# Run the backup script
./backup_database.sh

# Optional: Set up a cron job to run the backup script periodically
# echo "0 0 * * * /backup_database.sh" > /etc/cron.d/backup
# cron

exec "$@"
