variable "region" {
  type    = string
  default = ""
}

variable "AWS_ACCESS_KEY" {
  type = string
}
variable "AWS_SECRET_KEY" {
  type = string
}
variable "vpc_cidr" {
  type    = string
  default = ""
}
variable "availability_zone1" {
  type    = string
  default = ""
}

variable "ami-id" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = ""
}

variable "keypair" {
  type    = string
  default = ""
}

variable "service_name" {
  type    = string
  default = ""
}

variable "tool_subnet_cidr" {
  type    = string
  default = ""
}

variable "availability_zone" {
  type    = string
  default = ""
}

variable "subnet_name" {
  type    = string
  default = ""
}

variable "common_tags" {
  type = map(string)
  default = {
    project     = "Workday"
    environment = "Dev"
    team        = "Platform Engineering"
  }
}
variable "bucket_name" {
  type    = string
  default = ""
}

variable "dynamotable" {
  type    = string
  default = ""
}



