terraform {
  backend "s3" {
    bucket  = "sonu-terraform-state-unique-12345"
    key     = "ecs/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
