resource "aws_lambda_function" "lambda-idp" {
  filename         = "${path.module}/sftp-idp.zip"
  function_name    = "lambda-idp-${random_string.random_suffix.result}-${var.stage}"
  role             = aws_iam_role.lambda_idp_role.arn
  handler          = "index.lambda_handler"
  source_code_hash = data.archive_file.sftp-idp.output_base64sha256
  runtime          = "python3.7"

  environment {
    variables = {
      "${local.auth_source_name}" = local.auth_source_value
    }
  }
}