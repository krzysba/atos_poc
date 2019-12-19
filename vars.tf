variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
    eu-central-1 = "ami-0d4c3eabb9e72650a"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "/home/student/.ssh/id_rsa_frankfurt"
}

variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}
variable "security_group_id" {
  default = "sg-078b9b6dfd67da7cc"
}

