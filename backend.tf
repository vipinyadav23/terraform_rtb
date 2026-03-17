terraform {
  backend "s3" {
    bucket = "rtb-backend-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
    #dynamodb_table  = "backend"
    use_lockfile = true
    
  }
}