variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ssh_key_name" {
  type    = string
  default = "devops"
}

variable "allowed_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
