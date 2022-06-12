variable "rest_api_name" {
  type        = string
  description = "Name of the API Gateway created"
  default     = "serverless-challenge-api-gateway"
}

variable "readLambda_function_name" {
  type        = string
  description = "The name of the read Lambda function"
}

variable "readLambda_function_arn" {
  type        = string
  description = "The ARN of the read Lambda function"
}

variable "writeLambda_function_name" {
  type        = string
  description = "The name of the write Lambda function"
}

variable "writeLambda_function_arn" {
  type        = string
  description = "The ARN of the write Lambda function"
}

variable "rest_api_stage_name" {
  type        = string
  description = "The name of the API Gateway stage"
  default     = "prod" //add a stage name as per your requirement
}
