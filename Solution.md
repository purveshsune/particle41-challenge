
#  Simple Time Service – Particle41 DevOps Challenge

This repository contains a minimal Python FastAPI application deployed as a containerized service on DockerHub and on AWS using ECS Fargate and managed with Terraform.

The goal of this challenge is to showcase cloud-native DevOps practices by deploying a working microservice through infrastructure-as-code.

---
##  Prerequisites

1. **Install AWS CLI**  
   https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

2. **Install Terraform**  
   https://developer.hashicorp.com/terraform/downloads

3. **Install Docker (for testing container locally)**  
   https://docs.docker.com/get-docker/
---

## TASK 1 Minimalist Application Development using Docker

Ensure you're authenticated to your AWS account:

```bash
aws configure
```

You will be prompted to enter:

- AWS Access Key ID
- AWS Secret Access Key
---
##  How to Deploy

1. **Clone the repository**

```bash
git clone https://github.com/purveshsune/particle41-challenge.git
cd particle41-challenge
```
2. **Build the Docker Image**
```bash
docker build -t simpletimeservice .
```
3. **Run the Container**
```bash
docker run -p 8000:8000 simpletimeservice
```
#### Access the service at: http://localhost:8000
---
## End of TASK 1

# Task 2 - Terraform and Cloud: create the infrastructure to host your container.

##  Prerequisites

### **Docker image already published to DockerHub (Completed in above Task 1)**
---

##  Authentication

Before running Terraform commands, ensure you're authenticated to your AWS account:

```bash
aws configure
```

You will be prompted to enter:

- AWS Access Key ID
- AWS Secret Access Key
---

##  How to Deploy

1. **Clone the repository**

```bash
git clone https://github.com/purveshsune/particle41-challenge.git
cd particle41-challenge
```

2. **Initialize Terraform**

```bash
terraform init
```

3. **Deploy the infrastructure**

```bash
terraform apply
```

Terraform will create:

- VPC and networking components
- ECS Cluster and Service
- ALB with target groups and listeners
- IAM roles
- Docker container running FastAPI app

---

## How to Test
Once deployed, take loadbalancer URL and visit - 
```bash
http://<alb_dns_name>
```
You should see a JSON response like:
```bash
{
  "timestamp": "2025-05-15T17:30:00",
  "ip": "3.94.12.4"
}
```
## Delete all created resources

```bash
terraform destroy
```

>  Ensure you empty the S3 bucket (used for state) **manually** before destroying we are managing backend state in this project.

---

## Best Practices Followed

- Remote backend with state locking (S3 + DynamoDB)
- Fargate launch type for container security and scaling
- Private subnet ECS tasks with NAT access
- Use of variables and `terraform.tfvars` for configuration
- Minimal IAM permissions via separate execution role

---

## Author

**Purvesh Sune**  
AWS DevOps Engineer  
purvesh.sune.5@gmail.com |
9518918530  |
[LinkedIn](https://www.linkedin.com/in/purveshsune) | [GitHub](https://github.com/purveshsune)

---


