terraform {
backend "s3" {
    bucket = "mygarage-bucket"
    key = "backend/dev/mike/terraformstate"
    region = "eu-west-2"

  }
}