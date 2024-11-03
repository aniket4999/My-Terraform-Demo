# Create S3 bucket with versioning

provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_s3_bucket" "examples3" {
  bucket = "tfbucket4999"
}

resource "aws_s3_bucket_versioning" "statelock01" {
  bucket = aws_s3_bucket.examples3.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Create dynamo DB to enable locking 

resource "aws_dynamodb_table" "statelock" {
  name         = "State-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


terraform {
  backend "s3" {
    bucket         = "tfbucket4999"
    dynamodb_table = "State-lock"
    key            = "global/mystate/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}