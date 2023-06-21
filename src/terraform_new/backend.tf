terraform {
  backend "s3" {
    bucket = "bucket-name-unique"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}