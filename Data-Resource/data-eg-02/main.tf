#Data and state file demo eg

terraform {
    backend "s3" {
        bucket = "deletetest25"
        key = "all-az/terraform.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}

data "aws_availability_zones" "az" {
    state = "available"

#    filter {
#        name = "zone-type"
#        values = ["availability_zone"]
#    }
}

output "allaz" {
    value = data.aws_availability_zones.az.names
}

