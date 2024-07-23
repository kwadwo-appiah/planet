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

variable "aws_iam_user" {
  default = "appiah"
  type = string
  description = "test"
}

variable "aws_iam_policy" {
  default = "single_policy"
  type = string
  description = "aws_iam_policy_document"
}
variable "policy_arn" {
  default = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  type = string
}