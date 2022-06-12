terraform {
  backend "s3" {
    bucket = "terraform-state-challenge-week-7"
    key    = "terraform/serverless"
    region = "us-east-1"
  }
}
