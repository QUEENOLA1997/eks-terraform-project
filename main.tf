terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_iam_user" "developer" {
  name = "innovatemart-developer"
}

resource "aws_iam_access_key" "developer" {
  user = aws_iam_user.developer.name
}

output "developer_access_key" {
  value     = aws_iam_access_key.developer.id
  sensitive = true
}

output "developer_secret_key" {
  value     = aws_iam_access_key.developer.secret
  sensitive = true
} 
