provider "aws" {
  region = var.aws_region
  # credentials via environment / profile
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
