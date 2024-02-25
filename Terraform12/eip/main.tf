provider "aws" {
    region = "sa-east-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-05674a88169b69e3b"
    instance_type = "t2.micro"
}
resource "aws_eip" "elasticeip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elasticeip.public_ip
}
