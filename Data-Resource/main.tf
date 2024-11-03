# Data resource examples to get ami and az
provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}

data "aws_avsilability_zones" "az" {
    state = "available"

    filters {
        name = "zone-type"
        values = ["availability_zone]
    }
}

output "allaz" {
    value = data.aws_avsilability_zones.az.names
}

/*
# get all the ami
data "aws_ami" "allami" {
    most_recent = true
    owners = ["amazon"]
#    filters = {
#        name = "server"
#        values = [ "" ]
#    }
}

output "ubantu_id" {
    value = data.aws_ami.allami
}

resource "aws_instance" "test01" {
    ami = data.aws_ami.allami.id
    instance_type = "t2.micro"
}
*/