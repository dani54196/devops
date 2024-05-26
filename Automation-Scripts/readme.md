# Automation Scripts
As a DevOps professional, I frequently use these scripts in my daily work to streamline and automate various tasks:
### Install Docker 
When I start a new instance, I need to install Docker & Docker Compose. This script makes it easier.
Run 
```
chmod +x install-docker.sh
./install-docker.sh
```
[Install-Docker](./install-docker.sh)

### Step to backup a MySQL database
I use this script to make a backup of mysql database, in a wordpress in a viltual machine

Make script executable
```chmod +x backup-mysql.sh```
Run
```./backup-mysql.sh```

[Link to Script](./backup-mysql.sh)

### Dockerized Database Backup Script in AWS-S3
This is how I create and save MySQL backups in an S3 bucket. It can also be used for other databases and in a Docker instance or Kubernetes pod.

first run
```docker build -t database-backup .```
to run passing environment variables:
```
docker run -e DB_NAME=your_database_name \
           -e DB_USER=your_db_username \
           -e DB_PASSWORD=your_db_password \
           -e DB_HOST=your_db_host \
           -e S3_BUCKET=your_s3_bucket_name \
           -e BACKUP_PATH=/backups \
           -e RETENTION_DAYS=7 \
           -v /path/to/backup/folder:/backups \
           database-backup
```

Dockerfile: Defines a Docker image that installs necessary dependencies, copies the scripts, and sets the entrypoint.
backup_database.sh: Script that performs the backup, compresses it, uploads to S3, and handles cleanup.
entrypoint.sh: Script that runs the backup script and can set up a cron job if needed.
Environment Variables: Used to configure the backup script, making it flexible and reusable.
Volume Mounting: The -v option in docker run mounts a host directory to the container for storing backups.

### Monitoring System Health with Python

This script monitors CPU and memory usage using the psutil library.
If usage exceeds defined thresholds, it sends an email alert using the smtplib library. Now I use Prometheus + Grafana, but this script is good for simple deployments.

[Monitoring](./monitoring-system-health.py)

### Migration of Excel to MySQL
Usually, I get clients who have their data in Excel and I migrate it to MySQL to make the app.

First, install Python dependencies:
```pip install pandas mysql-connector-python```
I need to create the database diagram, but for now, here is a simple example.
[my_database.sql](./my_database.sql)

Here is the [Python Script](./excel-to-mysql.py)

execute the script
