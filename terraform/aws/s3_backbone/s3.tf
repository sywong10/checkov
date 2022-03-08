resource "aws_s3_bucket" "main" {
  bucket = "sally-tf-test-bucket"
//  acl = "private"

  tags = {
    Name = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "sally-example-tf" {
  bucket = aws_s3_bucket.main.id
  acl = "private"
}