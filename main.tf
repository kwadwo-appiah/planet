module "user" {
  source = "./iam"
aws_iam_user = var.aws_iam_user
aws_iam_policy = "onepolicy"
}
module "server" {
  source = "./ec2"
}
module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.1"
}
module "myvpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc"
  name = "stage"
}