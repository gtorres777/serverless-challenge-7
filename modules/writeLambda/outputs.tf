output "writeLambda_function_arn" {
  value = aws_lambda_function.writeLambda_function.invoke_arn
}

output "writeLambda_function_name" {
  value = aws_lambda_function.writeLambda_function.function_name
}
