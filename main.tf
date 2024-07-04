terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  alias = "new"
  region = "us-west-1"
}

provider "aws" {
  alias = "new2"
  region = "us-east-1"
}

resource "aws_iam_user" "test" {
  name = "Appiah"
}
data "aws_iam_policy_document" "muse" {
  statement {
    sid = "1appiahpolicy"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
      "s3:GetJobToggling",
    ]

    resources = [
      "arn:aws:s3:::aws-cloudtrail-logs-058264070128-91266772/*",
    ]
  }

}

resource "aws_iam_policy" "policy" {
  name   = "single_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.muse.json
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.test.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_user_policy_attachment" "test-attach2" {
  user       = aws_iam_user.test.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_instance" "this" {
  ami           = "ami-07c1b39b7b3d2525d"
  instance_type = "t2.micro"

  tags = {
    Name = "Agyenkwa"
  }
}

resource "aws_instance" "that" {
  ami           = "ami-0ff591da048329e00"
  provider = aws.new
  instance_type = "t2.micro"

  tags = {
    Name = "Yehowah"
  }
}

resource "aws_instance" "these" {
  ami           = "ami-04a81a99f5ec58529"
  provider = aws.new2
  instance_type = "t2.micro"

  tags = {
    Name = "Adom"
  }
}
output "ec2instanceip" {
  value= aws_instance.this.private_ip
}

output "uswestec2ip" {
  value= aws_instance.that.private_ip
}
output "useastec2ip" {
  value= aws_instance.these.private_ip
}
output "appiadid" {
  value= aws_iam_user.test.id
}
