provider "aws" {
    region = "sa-east-1"
}

resource "aws_instance" "db" {
    ami = "ami-05674a88169b69e3b"
    instance_type = "t2.micro"
}

resource "aws_instance" "web" {
    ami = "ami-05674a88169b69e3b"
    instance_type = "t2.micro"

    depends_on = [aws_instance.db]
}

