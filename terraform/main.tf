# EC2 Security Group
resource "aws_security_group" "allow_ssh_internal" {
  name        = "allow_ssh_internal"
  description = "Allow SSH between instances"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instances
resource "aws_instance" "ansible_controller" {
  ami           = "ami-03f4878755434977f" # Amazon Linux 2 in ap-south-1
  instance_type = "t2.micro"
  key_name      = var.key_name
  security_groups = [aws_security_group.allow_ssh_internal.name]
  tags = {
    Name = "AnsibleController"
  }
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  key_name      = var.key_name
  security_groups = [aws_security_group.allow_ssh_internal.name]
  tags = {
    Name = "JenkinsServer"
  }
}

# ECR Repository
resource "aws_ecr_repository" "kloudvidhya_repo" {
  name = "kloudvidhya_ecr_repo1"
}

# GitHub Repository
resource "github_repository" "kloudvidhya_repo" {
  name        = "kloudvidhya_devops_project1"
  description = "DevOps automation project"
  visibility  = "public"
}

