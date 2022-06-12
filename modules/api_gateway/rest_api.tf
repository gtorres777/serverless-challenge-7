resource "aws_api_gateway_rest_api" "rest_api" {
  name = var.rest_api_name
}

resource "aws_api_gateway_deployment" "rest_api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.readLambda_rest_api_resource.id,
      aws_api_gateway_method.readLambda_rest_api_get_method.id,
      aws_api_gateway_integration.readLambda_rest_api_get_method_integration.id,
      aws_api_gateway_resource.writeLambda_rest_api_resource.id,
      aws_api_gateway_method.writeLambda_rest_api_get_method.id,
      aws_api_gateway_integration.writeLambda_rest_api_get_method_integration.id
    ]))
  }

}

resource "aws_api_gateway_stage" "rest_api_stage" {
  deployment_id = aws_api_gateway_deployment.rest_api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  stage_name    = var.rest_api_stage_name
}
