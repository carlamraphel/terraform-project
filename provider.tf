provider "aws" {
  region = "ap-southeast-1"
  
  default_tags {
    tags = {
      Engineer = "Carl Amraphel Lat"
      ProjectCode = "Terraform101-STRAT-U-Course"
    } 
  }
}