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