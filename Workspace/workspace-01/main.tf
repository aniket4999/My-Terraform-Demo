provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = "/H/"
}


variable "ami" {
    description = "latest ami"
}

variable "instance-type" {
  description = "type"
}

resource "aws_instance" "workspace" {
    ami = var.ami
    instance_type = var.instance-type
}