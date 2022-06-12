output "readLambda_rest_api_url" {
  value = "${aws_api_gateway_deployment.rest_api_deployment.invoke_url}${aws_api_gateway_stage.rest_api_stage.stage_name}${aws_api_gateway_resource.readLambda_rest_api_resource.path}"
}

output "writeLambda_rest_api_url" {
  value = "${aws_api_gateway_deployment.rest_api_deployment.invoke_url}${aws_api_gateway_stage.rest_api_stage.stage_name}${aws_api_gateway_resource.writeLambda_rest_api_resource.path}"
}
