variable "region" {
  default = "eu-west-2"
  type = string
  description = "this is the default region"
}

variable "region1" {
  default = "us-west-1"
  type = string
  description = "this is the default region1"
}

variable "region2" {
  default = "us-east-1"
  type = string
  description = "this is the default region2"
}
variable "aws_instancethis" {
  default = "ami-07c1b39b7b3d2525d"
  type = string
  
}

variable "aws_instancethat" {
  default = "ami-0ff591da048329e00"
  type = string
  
}

variable "aws_instancethese" {
  default = "ami-04a81a99f5ec58529"
  type = string
}

variable "aws_instance_type_this" {
 default =  "t2.micro"
}

variable "aws_instance_type_that" {
 default =  "t2.micro"
}

variable "aws_instance_type_these" {
 default =  "t2.micro"
}

variable "tagName1" {
  default = "Agyenkwa"
}

variable "tagName2" {
  default = "Yehowah"
}

variable "tagName3" {
  default = "Adom"
}
