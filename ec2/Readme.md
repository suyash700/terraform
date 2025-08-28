# Terraform AWS EC2 Automation Project

This project demonstrates how to **provision an EC2 instance on AWS** using Terraform, including network, security, key pair, storage, and tagging. The setup is fully automated and repeatable, making it perfect for beginners to practice **Infrastructure as Code (IaC)** with Terraform.

---
<img width="1919" height="835" alt="Screenshot 2025-08-01 172457" src="https://github.com/user-attachments/assets/705c4e58-f533-47f6-ab48-4fcc6ee69a7d" />

## Features

- Creates a **default VPC** with proper tagging
- Configures **default security group** with ingress for HTTP (80) and SSH (22)
- Creates an **EC2 instance** with:
  - Key pair for secure SSH access
  - Nginx installation via `user_data`
  - 15GB root volume (gp3)
  - Proper tagging
- Outputs:
  - Public IP
  - Private IP
  - Public DNS

---

## Prerequisites

- Terraform v1.5+ installed
- AWS account with programmatic access (Access Key & Secret Key)
- AWS CLI configured or environment variables set:
 
 AWS_ACCESS_KEY_ID="your_access_key"
 AWS_SECRET_ACCESS_KEY="your_secret_key"


| File               | Description                                                    |
| ------------------ | -------------------------------------------------------------- |
| `provider.tf`      | Configures AWS provider and region                             |
| `terraform.tf`     | Specifies required Terraform providers                         |
| `main.tf`          | Defines resources: VPC, Security Group, Key Pair, EC2 instance |
| `outputs.tf`       | Defines output variables for EC2 instance info                 |
| `install_nginx.sh` | Script to install Nginx on EC2 instance (used in `user_data`)  |


Usage

1.Initialize Terraform
terraform init

2.Validate the configuration
terraform validate

3.Preview the resources
terraform plan

4.Apply the configuration
terraform apply

<img width="1852" height="950" alt="Screenshot 2025-08-01 172449" src="https://github.com/user-attachments/assets/c755c600-d229-40ca-8d90-1b199d70e5f3" />


5.View outputs
terraform output

6.Destroy resources when done
terraform destroy

## Learnings

 - How to declare AWS resources with Terraform

 - Managing key pairs, security groups, and VPCs

 - Automating EC2 instance creation and initialization

 - Using Terraform outputs to retrieve dynamic resource information

## Notes

 - Replace "public key" in aws_key_pair with your actual SSH public key.

 - Modify the AMI ID (ami-01f23391a59163da9) based on the region you are using.

 - The default security group allows public SSH and HTTP access; use carefully in production.

Author:
Suyash Dahitule

