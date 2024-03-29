resource "aws_api_gateway_account" "api_gateway_account" {
  cloudwatch_role_arn = aws_iam_role.apigateway_idp_role.arn
}

resource "aws_api_gateway_rest_api" "apigateway_rest" {
  name        = local.apigateway_rest_name
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

resource "aws_api_gateway_stage" "stage" {
  stage_name           = var.stage
  rest_api_id          = aws_api_gateway_rest_api.apigateway_rest.id
  deployment_id        = aws_api_gateway_deployment.deployment.id
  xray_tracing_enabled = true

  access_log_settings {
    destination_arn = "arn:aws:logs:region:${data.aws_caller_identity.current.account_id}:log-group:access_logging"
    format          = "json"
  }
}

resource "aws_api_gateway_method_settings" "all" {
  rest_api_id = aws_api_gateway_rest_api.apigateway_rest.id
  stage_name  = aws_api_gateway_stage.stage.stage_name
  method_path = "*/*"

  settings {
    metrics_enabled      = true
    logging_level        = "ERROR"
    caching_enabled      = true
    cache_data_encrypted = true
  }
}
