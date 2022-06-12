output "readLambda_function_arn" {
  value = aws_lambda_function.readLambda_function.invoke_arn
}

output "readLambda_function_name" {
  value = aws_lambda_function.readLambda_function.function_name
}
