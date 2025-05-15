terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
  backend "s3" {
    bucket = "particle41-bucket-locking"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "particle41-table"
  }
}
provider "aws" {
  region = var.aws_region
}