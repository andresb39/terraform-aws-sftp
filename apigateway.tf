resource "aws_api_gateway_account" "api_gateway_account" {
  cloudwatch_role_arn = aws_iam_role.apigateway_idp_role.arn
}

resource "aws_api_gateway_rest_api" "apigateway_rest" {
  name        = "apigateway-rest-${random_string.random_suffix.result}-${var.stage}"
  description = "This API provides an IDP for AWS Transfer service"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
  body = templatefile("${path.module}/source/apigateway/openapi.yaml", {
    LAMBDA_INVOKE_ARN = aws_lambda_function.lambda_idp.invoke_arn
  })
}

resource "aws_lambda_permission" "allow_apigateway" {
  statement_id  = "AllowExecutionFromApigateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_idp.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.apigateway_rest.execution_arn}/*/*/*"
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.apigateway_rest.id
  triggers = {
    redeployment = sha1(jsonencode([aws_api_gateway_rest_api.apigateway_rest.body]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

# tfsec:ignore:aws-api-gateway-enable-access-logging
# tfsec:ignore:aws-api-gateway-enable-tracing
resource "aws_api_gateway_stage" "stage" {
  stage_name    = var.stage
  rest_api_id   = aws_api_gateway_rest_api.apigateway_rest.id
  deployment_id = aws_api_gateway_deployment.deployment.id
}
