module "lambda1" {
  source = "./modules/lambda1"
}

module "api_gateway" {
  source = "./modules/api_gateway"
  lambda_function_name = module.lambda1.lambda1_function_name
  lambda_function_arn = module.lambda1.lambda1_function_arn

  depends_on = [
    module.lambda1
  ]
}
