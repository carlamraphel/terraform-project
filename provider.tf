terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket          = "final-project-bucket1"
    key             = "terraform.tfstate"
    region          = "ap-southeast-1"
    dynamodb_table  = "tfstate-table"
  }
}

provider "aws" {
  region = "ap-southeast-1"
  
  default_tags {
    tags = {
      Engineer = "Carl Amraphel Lat"
      ProjectCode = "Terraform101-STRAT-U-Course"
    } 
  }
}