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
