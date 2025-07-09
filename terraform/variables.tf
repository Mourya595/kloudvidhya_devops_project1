variable "aws_region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "NewKeyPair"
  type        = string
}

variable "github_token" {
  description = "Github Token"
  type        = string
  sensitive   = true
}

variable "github_username" {
  description = "Mourya595"
  type        = string
}

