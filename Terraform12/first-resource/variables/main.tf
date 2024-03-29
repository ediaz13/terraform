provider "aws" {
    region = "sa-east-1"
}

variable "vpcname" {
  type = string
  default = "myvpc"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
  type = bool
  default = true
}

variable "myList" {
  type = list(string)
  default = [ "Value1", "Value2" ]
}

variable "myMap" {
  type = map
  default = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

variable "inputname" {
  type = string
  description = "Set the name of the VPC"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      //Name = var.vpcname
      //Name = var.myList[0]
      //Name = var.myMap["Key1"]
      Name = var.inputname
    }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

variable "mytuple" {
  type = tuple([ string, number, string ])
  default = [ "cat", 1, "dog" ]
}

variable "myobject" {
  type = object({
    name = string,
    port = list(number)

  })

  default = {
    name = "Mogul"
    port = [ 22, 25, 80 ]
  }

}