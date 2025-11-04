variable "aws_region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ssh_key_name" {
  default = "devops"
}

variable "allowed_cidr" {
  default = "0.0.0.0/0"
}
