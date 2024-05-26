# Continuous integration / Continuous delivery (CI/CD)
This section i show my tools i use
# GitHib-Actions
**docker-compose in EC2**
I make my deploy in a cloud instance, get the code of main and execute ```docker-compose up --build -d```

This case ec2 of Amazon Web Services, but can be vm of Google Cloud Plataform, or a droplet of Digital Ocean
Requisites:
This pepiline works in a instance with docker and docker-compose intall [Docker-Install-Script](../Automation-Scripts/install-docker.sh)
The server can be set up by cloud provide console or with Terraform [Terraform-EC2-Instance](../IaC/AWS/main.tf)

Add EC2 Instance Details to GitHub Secrets:

Add your EC2 instance's IP address to your GitHub repository secrets as EC2_IP_ADDRESS.
Add your EC2 instance's SSH username to your GitHub repository secrets as EC2_SSH_USER.

1. Checkout Code:
Uses the actions/checkout@v2 action to clone the repository code.
Set Up SSH:

2. Uses the webfactory/ssh-agent@v0.5.3 action to set up the SSH agent with the private key stored in GitHub secrets (EC2_SSH_KEY).
Copy Files to EC2:

3. Uses scp to securely copy the repository files to the EC2 instance. The files are copied to the /home/${{ secrets.EC2_SSH_USER }}/app directory on the instance.
Run Docker Compose on EC2:

4. Uses ssh to connect to the EC2 instance and navigate to the application directory.
Stops any existing containers with docker-compose down.
Builds and starts the containers with docker-compose up -d --build.

**Vite GH-Pages**

GitHub Pages
Set the correct base in vite.config.js.

If you are deploying to https://<USERNAME>.github.io/, or to a custom domain through GitHub Pages (eg. www.example.com), set base to '/'. Alternatively, you can remove base from the configuration, as it defaults to '/'.

If you are deploying to https://<USERNAME>.github.io/<REPO>/ (eg. your repository is at https://github.com/<USERNAME>/<REPO>), then set base to '/<REPO>/'.

Go to your GitHub Pages configuration in the repository settings page and choose the source of deployment as "GitHub Actions", this will lead you to create a workflow that builds and deploys your project, a sample workflow that installs dependencies and builds using npm is provided:

**Security Considerations**
Ensure that your SSH private key is kept secure and only added to GitHub secrets.
Make sure your EC2 instance has the necessary security group rules to allow SSH access from GitHub Actions.

# Argo CD
Argo CD Setup and Configuration

1. Installation
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
2. Access Argo CD
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
3. Login
```
argocd login localhost:8080
```
4. Deploy Sample Application
```
argocd app create guestbook --repo https://github.com/argoproj/argocd-example-apps --path guestbook --dest-server https://kubernetes.default.svc --dest-namespace default
argocd app sync guestbook
```
