🚀 Terraform Project: EC2 + S3 + Remote Backend
📌 Overview

This project provisions a simple AWS infrastructure using Terraform:

EC2 Instance → Ubuntu server

S3 Bucket → Store Terraform state files securely

DynamoDB Table → For state locking (avoids conflicts in collaboration)

Remote Backend Setup → Terraform connected to S3 + DynamoDB

This is a beginner-friendly project to learn Infrastructure as Code (IaC) with AWS & Terraform.

🛠️ Project Architecture
Terraform  --->  S3 Bucket (State Storage)
             ---> DynamoDB (State Locking)
             ---> EC2 Instance (Provisioned Infra)

🔎 What You’ll Learn

Why .tfstate should not be committed to GitHub

Difference between local vs remote state in Terraform

How to configure S3 backend + DynamoDB locking

Provisioning EC2 with IAM roles & Terraform scripts

Real-world workflow for Infra-as-Code projects

📂 Project Structure
├── main.tf          # EC2 + VPC/Networking + IAM roles
├── backend.tf       # Remote backend configuration (S3 + DynamoDB)
├── variables.tf     # Input variables
├── outputs.tf       # Outputs after provisioning
└── README.md        # Documentation

⚡ Prerequisites

AWS account

IAM user/role with permissions for EC2, S3, DynamoDB

Terraform installed (v1.5+)

AWS CLI configured with credentials

🚀 Steps to Run

1️⃣ Clone the repository

git clone https://github.com/yourusername/terraform-ec2-s3-backend.git
cd terraform-ec2-s3-backend


2️⃣ Initialize Terraform

terraform init


3️⃣ Validate & Plan

terraform validate
terraform plan


4️⃣ Apply configuration

terraform apply


5️⃣ Destroy resources when done

terraform destroy

📘 Resources

Terraform Docs

AWS Provider

Remote State Storage

Author:
Suyash Dahitule
