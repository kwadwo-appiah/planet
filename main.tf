terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
  backend "s3" {
    bucket = "mymikebucket"
    key = "backend/dev/mike/terraformstate"
    region = "eu-west-2"

  }

}

provider "aws" {
  region = var.region
}

provider "aws" {
  alias = "new"
  region = var.region1
}

provider "aws" {
  alias = "new2"
  region = var.region2
}

resource "aws_iam_user" "test" {
  name = var.aws_iam_user
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
  name   = var.aws_iam_policy
  path   = "/"
  policy = data.aws_iam_policy_document.muse.json
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.test.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_user_policy_attachment" "test-attach2" {
  user       = aws_iam_user.test.name
  policy_arn = var.policy_arn
}

resource "aws_instance" "this" {
  ami           = var.aws_instancethis
  instance_type = var.aws_instance_type_this

  tags = {
    Name = var.tagName1
  }
}

resource "aws_instance" "that" {
  ami           = var.aws_instancethat
  provider = aws.new
  instance_type = var.aws_instance_type_that

  tags = {
    Name = var.tagName2
  }
}

resource "aws_instance" "these" {
  ami           = "ami-04a81a99f5ec58529"
  provider = aws.new2
  instance_type = var.aws_instance_type_these

  tags = {
    Name = var.tagName3
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
