terraform {
  required_version = ">= v1.14.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= v6.26.0"
    }
  }
}