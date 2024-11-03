/*
provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}
*/
resource "aws_instance" "test01" {
    ami = var.ami_value
    instance_type = var.instancetype_value
    subnet_id = var.subnet_value
}