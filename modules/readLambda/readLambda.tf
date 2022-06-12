data "archive_file" "readLambda_code" {
  type        = "zip"
  source_dir  = "${path.module}/read_function_code"
  output_path = "${path.module}/read_function_code.zip"
}

resource "aws_s3_object" "readLambda_code" {
  bucket = var.aws_s3_lambdas_bucket_id
  key    = "read_function_code.zip"
  source = data.archive_file.readLambda_code.output_path
  etag   = filemd5(data.archive_file.readLambda_code.output_path)
}


/* Configuration to create lambda function */

resource "aws_lambda_function" "readLambda_function" {
  function_name    = var.readLambda_function_name
  s3_bucket        = var.aws_s3_lambdas_bucket_id
  s3_key           = aws_s3_object.readLambda_code.key
  runtime          = "nodejs14.x"
  handler          = "index.handler"
  source_code_hash = data.archive_file.readLambda_code.output_base64sha256
  role             = aws_iam_role.readLambda_execution_role.arn
}

resource "aws_cloudwatch_log_group" "readLambda_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.readLambda_function.function_name}"
  retention_in_days = 30
}

resource "aws_iam_role" "readLambda_execution_role" {
  name = "readLambda_execution_role_${var.readLambda_function_name}"

  assume_role_policy = file("policies/assume_readLambda_role_policy.json")
}

resource "aws_iam_role_policy" "readLambda_policy" {
  name = "readlambda_policy"
  role = aws_iam_role.readLambda_execution_role.id

  policy = file("policies/readLambda_policy.json")
}

resource "aws_iam_role_policy_attachment" "readLambda_policy" {
  role       = aws_iam_role.readLambda_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
