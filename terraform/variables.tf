variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "simple-time-service"
  type        = string
  default     = "simple-time-service"
}

variable "docker_image_url" {
  description = "600627327564.dkr.ecr.us-east-1.amazonaws.com/simpletimeservice:latest"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ECS tasks or other AWS resources"
  type        = list(string)
}
