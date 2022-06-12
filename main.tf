module "s3_lambdas_code" {
  source = "./modules/s3_lambdas_code"

}

module "readLambda" {
  source = "./modules/readLambda"
  aws_s3_lambdas_bucket_id = module.s3_lambdas_code.aws_s3_lambdas_bucket_id
}


module "writeLambda" {
  source = "./modules/writeLambda"
  aws_s3_lambdas_bucket_id = module.s3_lambdas_code.aws_s3_lambdas_bucket_id
}

module "api_gateway" {
  source = "./modules/api_gateway"
  readLambda_function_name = module.readLambda.readLambda_function_name
  readLambda_function_arn = module.readLambda.readLambda_function_arn
  writeLambda_function_name = module.writeLambda.writeLambda_function_name
  writeLambda_function_arn = module.writeLambda.writeLambda_function_arn

  depends_on = [
    module.readLambda,
    module.writeLambda
  ]

}
