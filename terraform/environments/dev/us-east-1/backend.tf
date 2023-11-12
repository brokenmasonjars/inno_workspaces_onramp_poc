terraform {
  required_version = ">= 1.5.7"
backend "s3" {
    bucket         = "mason-training-tf-backend-309174895017"
    dynamodb_table = "mason-training-tf-backend-309174895017"
    key            = "workspace-onramp-poc/dev/terraform.tfstate"
    kms_key_id     = "arn:aws:kms:us-east-1:309174895017:key/317852db-7aa3-426d-b2ae-bd9d6e0c8d7e"
    region         = "us-east-1"
    encrypt        = "true"
    profile        = "mason_training"
 }
} 