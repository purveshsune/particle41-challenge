terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
  backend "local" {
  }
}
provider "aws" {
  region = var.aws_region
}