# DevOps Portfolio
This repository showcases my expertise in DevOps, highlighting various aspects of application packaging, containerization, cloud knowledge, and CI/CD. It demonstrates my proficiency in Docker, including the use of Docker Compose, Docker networking, and Docker volumes across multiple programming languages. Examples of these skills are implemented through GitHub Actions for automating build, test, and deployment processes. The repository also reflects my ability to deploy applications and manage them in cloud environments, along with my skills in monitoring applications to ensure optimal performance.

# Skills and Tools
+ **Skills:** CI/CD, Containerization, Infrastructure as Code, Monitoring, Automation, Cloud Computing, Scripting, Linux
+ **Tools:** Docker, Kubernetes, Terraform, Ansible, Jenkins, Prometheus, Grafana, AWS, GCP, Bash, Python

# Projects
All these applications run with Docker and Docker Compose:
In apps folder ```./apps```
- Mongo + React + Node
- Typescript + Mongo
- Golang + MySQL + React + Nginx
- Python + SQLAlchemy
<!-- - Java -->
- WordPress
- Pocketbase
- Microservices with Python + React
- Mail server

Need Docker and Docker Compose:
- [Docker](https://www.digitalocean.com/community/tutorial-collections/how-to-install-and-use-docker)
- [Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)

# Cloud & Deploy
Cloud knowledge with Google Cloud Platform and Amazon Web Services.

## Deployment Steps
1. Create an instance using the cloud console or Terraform.
2. Connect via SSH using a `.pem` key.
3. Set up the application.
4. Configure domains using Cloudflare.
5. Manage domains, subdomains, DNS, and SSL certificates with Cloudflare NGINX Proxy Manager for HTTPS connections.

### Terraform
Infrastructure as Code examples are available in the Terraform folder.

# Monitoring and Alerting
Metrics for servers, services, and containers are collected using Prometheus and Grafana.

# Automatication
### mysql backups

```
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
```
Make script executable
```chmod +x backup.sh```
Run
```./backup.sh```
### docker & docker-compose intalation
```
#!/bin/bash

# This script installs Docker and Docker Compose on an Ubuntu system.

# Update the package index
sudo apt-get update -y

# Install prerequisite packages
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the Docker APT repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the package index again with the Docker repository
sudo apt-get update -y

# Install Docker CE
sudo apt-get install -y docker-ce

# Start Docker and enable it to start on boot
sudo systemctl start docker
sudo systemctl enable docker

# Verify that Docker CE is installed correctly by running the hello-world image
sudo docker run hello-world

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the Docker Compose binary
sudo chmod +x /usr/local/bin/docker-compose

# Verify that Docker Compose is installed correctly
docker-compose --version

# Add the current user to the Docker group to run Docker without sudo
sudo usermod -aG docker $USER

# Print completion message
echo "Docker and Docker Compose installation is complete."
echo "You need to log out and log back in to apply the Docker group changes."
```
run 
```
chmod +x install_docker.sh
./install_docker.sh
```

<!-- # Security
Implementing security best practices, including vulnerability assessments and automated security tasks. -->

# Contact Information
Daniel Cardozo  
Email: danicardozo@dc.uba.ar  
Website: [https://south.software](https://south.software)
