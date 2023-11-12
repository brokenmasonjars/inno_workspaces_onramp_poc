terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = ">= 5.25.0"
        }
    }
}

#Region & Profile
provider "aws" {
  profile = "mason_training"
  region  = "us-east-1"

  default_tags {
    tags = {
      Environment = var.environment_name
      Owner       = var.customer_name
      CreatedBy   = "Terraform"
    }
  }
}

data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}
data "aws_region" "current" {}