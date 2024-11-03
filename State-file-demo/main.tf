#State file demo example

terraform {
    backend "s3" {
        bucket = "deletetest25"
        key = "file/terraform.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}

resource "aws_instance" "test01" {
    ami = "ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    
    tags = {
        name = "Terraform EC2"
    }
}