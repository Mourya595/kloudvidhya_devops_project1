output "ansible_public_ip" {
  value = aws_instance.ansible_controller.public_ip
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}

output "ecr_repo_url" {
  value = aws_ecr_repository.kloudvidhya_repo.repository_url
}

