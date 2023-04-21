resource "aws_iam_role" "apigateway_idp_role" {
  name = "apigateway_idp_role-${random_string.random_suffix.result}-${var.stage}"

  assume_role_policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "apigateway.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
  EOF
}

resource "aws_iam_role_policy_attachment" "apigateway_cloudwatchlogs" {
  role       = aws_iam_role.apigateway_idp_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"
}

# roles for SFTP server
resource "aws_iam_role" "sftp" {
  name = "sftp-server-iam-role-${random_string.random_suffix.result}-${var.stage}"

  assume_role_policy = <<-POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
            "Effect": "Allow",
            "Principal": {
                "Service": "transfer.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
            }
        ]
    }
  POLICY
}

resource "aws_iam_role_policy" "sftp" {
  # policy to allow invocation of IdP API
  name = "sftp-server-iam-policy-${random_string.random_suffix.result}-${var.stage}"
  role = aws_iam_role.sftp.id

  policy = <<-POLICY
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "InvokeApi",
          "Effect": "Allow",
          "Action": [
            "execute-api:Invoke"
          ],
          "Resource": "arn:aws:execute-api:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.apigateway_rest.id}/${aws_api_gateway_stage.stage.stage_name}/GET/*"
        },
        {
          "Sid": "ReadApi",
          "Effect": "Allow",
          "Action": [
            "apigateway:GET"
          ],
          "Resource": "*"
        }
      ]
    }
  POLICY
}

resource "aws_iam_role" "sftp_log" {
  # log role for SFTP server
  name = "sftp-server-iam-log-role-${random_string.random_suffix.result}-${var.stage}"

  assume_role_policy = <<-POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
            "Effect": "Allow",
            "Principal": {
                "Service": "transfer.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
            }
        ]
    }
  POLICY
}

resource "aws_iam_role_policy" "sftp_log" {
  # policy to allow logging to Cloudwatch
  name = "sftp-server-iam-log-policy-${random_string.random_suffix.result}-${var.stage}"
  role = aws_iam_role.sftp_log.id
	# tfsec:ignore:aws-iam-no-policy-wildcards
  policy = <<-POLICY
    {
      "Version": "2012-10-17",
      "Statement": [{
          "Sid": "AllowFullAccesstoCloudWatchLogs",
          "Effect": "Allow",
          "Action": [
            "logs:*"
          ],
          "Resource": "*"
        }
      ]
    }
  POLICY
}

# Roles for Lambdas
resource "aws_iam_role" "lambda_idp_role" {
  name = "${random_string.random_suffix.result}-${var.stage}"

  assume_role_policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "lambda.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
  EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs_idp" {
  role       = aws_iam_role.lambda_idp_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_policy" "lambda_idp_policy" {
  name        = "${random_string.random_suffix.result}-${var.stage}"
  path        = "/"
  description = "IAM policy IdP service for SFTP in Lambda"

  policy = <<-EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "secretsmanager:GetSecretValue",
                "Resource": "arn:aws:secretsmanager:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:secret:SFTP/*"
            }
        ]
    }
  EOF
}

resource "aws_iam_role_policy_attachment" "lambda_idp_att" {
  role       = aws_iam_role.lambda_idp_role.name
  policy_arn = aws_iam_policy.lambda_idp_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_idp_att_exc" {
  role       = aws_iam_role.lambda_idp_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
