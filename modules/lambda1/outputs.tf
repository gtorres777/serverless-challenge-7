output "lambda1_function_arn" {
  value = aws_lambda_function.lambda1_function.invoke_arn
}

output "lambda1_function_name" {
  value = aws_lambda_function.lambda1_function.function_name
}
