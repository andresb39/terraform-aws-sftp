resource "aws_lambda_function" "lambda_idp" {
  filename         = local.filename
  function_name    = local.function_name
  role             = aws_iam_role.lambda_idp_role.arn
  handler          = "index.lambda_handler"
  source_code_hash = data.archive_file.sftp_idp.output_base64sha256
  runtime          = "python3.7"

  environment {
    variables = {
      "SecretsManagerRegion" = local.auth_source_value
    }
  }
  tracing_config {
    mode = "Active"
  }
}
