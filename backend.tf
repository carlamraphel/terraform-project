terraform {
  backend "s3" {
    bucket          = "final-project-bucket1"
    key             = "terraform.tfstate"
    region          = "ap-southeast-1"
    dynamodb_table  = "tfstate-table"
  }
}