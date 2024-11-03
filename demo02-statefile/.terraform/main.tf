
terraform {
  backend "s3" {
    bucket = "tfbucket4999"
    dynamodb_table = "State-lock"
    key    = "global/mystate/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
