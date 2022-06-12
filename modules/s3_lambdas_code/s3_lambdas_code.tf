resource "aws_s3_bucket" "lambdas_bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_acl" "lambdas_bucket_acl" {
  bucket = aws_s3_bucket.lambdas_bucket.id
  acl    = "private"
}
