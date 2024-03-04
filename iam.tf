locals {
  common_actions = [
    "kms:Encrypt",
    "kms:Decrypt",
    "kms:ReEncrypt*",
    "kms:GenerateDataKey*",
    "kms:DescribeKey"
  ]
}

data "aws_iam_policy_document" "assume_role_common" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com", "transfer.amazonaws.com", "lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "apigateway_idp_role" {
  name               = local.apigateway_idp_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_common.json
}

resource "aws_iam_role" "sftp" {
  name               = local.sftp_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_common.json
}

resource "aws_iam_role" "sftp_log" {
  name                = local.sftp_log_role_name
  assume_role_policy  = data.aws_iam_policy_document.assume_role_common.json
  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSTransferLoggingAccess"]
}

resource "aws_iam_role" "lambda_idp_role" {
  name               = local.lambda_idp_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_common.json
}

# Attach AWS managed policy to API Gateway role
resource "aws_iam_role_policy_attachment" "apigateway_cloudwatchlogs" {
  role       = aws_iam_role.apigateway_idp_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"
}

# Custom IAM policy for Lambda
resource "aws_iam_policy" "lambda_idp_policy" {
  name        = local.lambda_idp_iam_policy_name
  path        = "/"
  description = "IAM policy for Lambda"
  policy      = data.aws_iam_policy_document.lambda_idp_policy.json
}

# IAM policy document for Lambda
#tfsec:ignore:AWS:aws-iam-no-policy-wildcards
data "aws_iam_policy_document" "lambda_idp_policy" {
  statement {
    effect    = "Allow"
    actions   = ["secretsmanager:GetSecretValue"]
    resources = ["arn:aws:secretsmanager:${var.aws_region}:${data.aws_caller_identity.current.account_id}:secret:SFTP/*"]
    sid       = "SecretsManagerAccess"
  }
  statement {
    effect    = "Allow"
    actions   = local.common_actions #tfsec:ignore:aws-iam-no-policy-wildcards
    resources = ["arn:aws:kms:${var.aws_region}:${data.aws_caller_identity.current.account_id}:key/*"]
    sid       = "KMSAccess"
  }
}

# Attach custom and AWS managed policies to Lambda role
resource "aws_iam_role_policy_attachment" "lambda_idp" {
  role       = aws_iam_role.lambda_idp_role.name
  policy_arn = aws_iam_policy.lambda_idp_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_idp_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
