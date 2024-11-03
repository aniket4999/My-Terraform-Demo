provider "aws" {
    region= ""
    access_key = ""
    secret_key = ""
}

variable "cidr" {
    defaults= "10.0.0.0/16"
}

resource "aws_key_pair" "mykey" {
    key_name = ""
    public_key = ""
}

resource "aws_vpc" "tfvpc" {
    cidr_block = "var.cidr"
}

resource "aws_subnet" "mysub01" {
    vpc_id     = aws_vpc.tfvpc.id
    cidr_block = "10.0.1.0/24"
}