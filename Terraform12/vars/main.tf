provider "aws" {
    region = "sa-east-1"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "ec2" {
    ami = "ami-05674a88169b69e3b"
    instance_type = "t2.micro"
    count = var.number_of_servers
}