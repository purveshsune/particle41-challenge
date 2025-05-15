
#  Simple Time Service – Particle41 DevOps Challenge

This repository contains a minimal Python FastAPI application deployed as a containerized service on AWS using ECS Fargate and managed with Terraform.

The goal of this challenge is to showcase cloud-native DevOps practices by deploying a working microservice through infrastructure-as-code.

---


##  Features

- Python FastAPI service
- Dockerized and deployed via ECS Fargate
- Infrastructure managed entirely with Terraform
- Remote state using S3 + DynamoDB
- Secure deployment using private subnets and NAT
- Clear separation of variables and config

---

##  Prerequisites

1. **Install AWS CLI**  
   https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

2. **Install Terraform**  
   https://developer.hashicorp.com/terraform/downloads

3. **Install Docker (for testing container locally)**  
   https://docs.docker.com/get-docker/

4. **Create S3 and DynamoDB manually for Terraform State Locking to work**  
   Update versions.tf with the S3 and DynamoDB you created manually.
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

2. **Update Terraform variables (if needed)**

Default values are present in `terraform.tfvars`. Modify if you'd like to override them.

3. **Initialize Terraform**

```bash
terraform init
```

4. **Deploy the infrastructure**

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

After `terraform apply`, Terraform will output the **Application Load Balancer URL**.

To verify:

```bash
curl http://<load-balancer-dns>/time
```


---



To delete all created resources:

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
- Reusable and readable Terraform module layout
- Secrets/credentials **not committed** to repo

---

## Author

**Purvesh Sune**  
AWS DevOps Engineer  
purvesh.sune.5@gmail.com |
9518918530  |
[LinkedIn](https://www.linkedin.com/in/purveshsune) | [GitHub](https://github.com/purveshsune)

---

## Notes

- The container image is publicly hosted on Docker Hub (`purveshsune/simpletimeservice`). You may change the image URL in `terraform.tfvars`.
- This setup uses `awsvpc` network mode for Fargate which requires at least one public subnet with NAT Gateway for ECR access.

---
