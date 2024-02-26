provider "aws" {
    region = "sa-east-1"
}

module "db" {
    source = "./db"
    
}

module "web" {
    source = "./web"  
}

output "PrivateIP" {
    value = module.db.PrivateIP
}

output "PublicIP" {
    value = module.web.pub_ip
}