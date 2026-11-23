# Terraform AWS EC2 Web Server

## Overview
Provisioned a Linux EC2 web server on AWS using Terraform.
Apache HTTP Server is automatically installed and configured
using Bash through EC2 User Data.

## Architecture
- AWS VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance
- Apache HTTP Server

## Technologies Used
- AWS EC2
- AWS VPC
- Terraform
- Bash
- Apache HTTP Server

## Deployment
1. Configure AWS CLI credentials.
2. Clone the repository.
3. Run:

   terraform init
   terraform validate
   terraform plan
   terraform apply

## Web Server
Apache is installed automatically using EC2 User Data.
The instance serves a custom HTML page over HTTP.

## Cleanup
To delete the resources created by Terraform:

    terraform destroy