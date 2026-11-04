terraform {
  required_version = ">= 1.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.28"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project   = "eks-monitoring-lab"
      ManagedBy = "terraform"
    }
  }
}
