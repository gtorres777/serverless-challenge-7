variable "rest_api_name"{
    type = string
    description = "Name of the API Gateway created"
    default = "serverless-challenge-api-gateway"
}

variable "lambda_function_name" {
  type        = string
  description = "The name of the Lambda function"
} //value comes from main.tf

variable "lambda_function_arn" {
  type        = string
  description = "The ARN of the Lambda function"
} //value comes from main.tf


variable "rest_api_stage_name" {
  type        = string
  description = "The name of the API Gateway stage"
  default     = "prod" //add a stage name as per your requirement
}
