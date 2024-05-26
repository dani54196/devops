provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI ID in us-west-2
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }

  key_name = "your-key-pair-name"

  # Adding user_data to execute commands at instance launch
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              EOF
}

# Security group to allow SSH access
resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Associate security group with the instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "your-key-pair-name"

  vpc_security_group_ids = [aws_security_group.example.id]

  tags = {
    Name = "example-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              EOF
}