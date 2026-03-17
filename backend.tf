terraform {
  backend "s3" {
    bucket = "backend-bucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table  = "backend"
    
  }
}