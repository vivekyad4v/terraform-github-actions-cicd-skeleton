terraform {
  required_providers {
    aws = {
      version = ">= 3.63.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {}
}

variable "s3_bucket_name" {}
variable "dynamodb_table_name" {}
variable "region" {}
variable "project" {}
variable "environ" {}
