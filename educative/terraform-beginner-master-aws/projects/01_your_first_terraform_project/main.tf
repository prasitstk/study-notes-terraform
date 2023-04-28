provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "first_bucket" {
  bucket = "tf-aws-basic-first-bucket.thecodecarbon.com"
}
