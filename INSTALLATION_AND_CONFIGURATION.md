# INSTALLATION_AND_CONFIGURATION.md

## Terraform
- Installed using apt on Ubuntu.
- Files: `main.tf`, `variables.tf`, `outputs.tf`
- Provisions EC2 instances with proper IAM roles and security groups.

## Ansible
- Used to install Jenkins and deploy NGINX containers.
- Playbooks in `ansible_playbooks/`:
  - `install_jenkins.yml`
  - `deploy_nginx_container.yml`

## Jenkins
- Installed via Ansible.
- Runs as a system service.
- Configured with a Free-Style Job pulling code from GitHub and pushing Docker image to ECR.

## Docker
- Installed on Jenkins and Deployment EC2 instances.
- Dockerfile builds custom NGINX image with `index.html`.

## AWS CLI / ECR Setup
- IAM role with `AmazonEC2ContainerRegistryFullAccess` attached to Jenkins instance.
- ECR repo created: `kloudvidhya-nginx`
- Used AWS CLI for login and image push/pull.

## GitHub Integration
- GitHub repo used: [https://github.com/Mourya595/kloudvidhya_devops_project1]
- Jenkins job pulls the repo and uses Dockerfile from root.

## Environment & Prerequisites
- EC2 Ubuntu instances
- Open ports: `22` (SSH), `8080` (Jenkins), `80` (NGINX)
- Terraform, AWS CLI, Docker installed
- No hardcoded credentials; IAM roles used for AWS authentication.

