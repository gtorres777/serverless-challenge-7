variable "aws_s3_lambdas_bucket_id" {
  type        = string
  description = "The s3 bucket id where the lambdas code are stored"
}

variable "writeLambda_function_name" {
  type        = string
  description = "The name of the Lambda function"
  default     = "writeLambda"
}
