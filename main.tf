terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "name" {
  type = string
}

variable "prefix" {
  type = string
}

module "s3-webapp" {
  source  = "careful-pigeon.tf-support.hashicorpdemo.com/careful-pigeon/s3-webapp/aws"
  name   = var.name
  region = var.region
  prefix = var.prefix
  version = "1.0.0"
}

output "website_endpoint" {
  value = module.s3-webapp.endpoint
}
  
# COMMENT
