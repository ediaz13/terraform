resource "aws_instance" "db" {
    ami = "ami-05674a88169b69e3b"
    instance_type = "t2.micro"

    tags = {
        Name = "DB Server"
    }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}