provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}
module "create_ec2" {
    source = "./module/ec2"
    ami_value = "ami-0fff1b9a61dec8a5f"
    instancetype_value = "t2.micro"
    subnet_value = "subnet-054c4912158d85c1f"
}