#create ec2 instance and get the IP from the created instance

provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = "//"
}

resource "aws_instance" "test01" {
    ami = "ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    
    tags = {
        name = "Terraform EC2"
    }
}

data "aws_instance" "myinstance" {
    filter {
         name = "tag:name"
         values = ["Terraform EC2"]
    }
         depends_on = [
            "aws_instance.test01"
            ]
    
}

output "get_info" {
    value = data.aws_instance.myinstance.public_ip
}