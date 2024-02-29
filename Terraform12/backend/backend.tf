terraform {
  backend "s3" {
    key = "teraform/tfstate.tfstate"
    bucket = "mogul-remote-backend-2024"
    region = "sa-east-1"
    access_key = ""
    secret_key = ""
  }
}