# Infrastructure as Code (IaC)
I use Terraform to set up my instances
here is a example of ec2 instance, cluster in gcp, and

# Instance in AWS EC2
Here’s a simple example of how to use Terraform to provision an EC2 instance on AWS.

Prerequisites
AWS Account: Ensure you have an AWS account.
AWS CLI: Configure your AWS CLI with your access and secret keys.
Terraform: Install Terraform on your local machine.

### Create a Terraform Configuration File
[main.tf](./AWS/main.tf)
Initialize Terraform:
```terraform init```
Format and Validate Configuration:
```
terraform fmt
terraform validate
```
Create an Execution Plan:
```terraform plan```
Apply the Terraform Configuration:
```terraform apply```
Type yes when prompted to confirm the action.

Destroy
```terraform destroy```

### Explanation of the Configuration
1. Provider Configuration:

2. Specifies the AWS region.
AWS Instance Resource:
ami: The Amazon Machine Image ID to use for the instance.
instance_type: The type of instance to use (e.g., t2.micro).
key_name: The name of the SSH key pair to use for the instance.
user_data: Specifies commands to run at instance launch.

3. AWS Security Group:
Defines a security group that allows SSH access from anywhere (0.0.0.0/0).

4. Instance Tags:
Adds a tag to the instance for identification.

5. VPC Security Group Association:
Associates the instance with the created security group to manage access rules.


# Cluster in GCP

6. Check cluster
```kubectl get pods```

[EKS](./GKE/main.tf)