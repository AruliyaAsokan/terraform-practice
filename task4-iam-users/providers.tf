terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "tfstate-practice-590507089733"
    key    = "task4-iam-users/terraform.tfstate"
    region = "ap-south-1"
  }
}
