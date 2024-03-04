resource "aws_cloudwatch_log_group" "transfer" {
  name              = local.sftp_log_group
  kms_key_id        = aws_kms_key.sftp_log_group.arn
  retention_in_days = 30
}

resource "aws_transfer_server" "sftp" {
  identity_provider_type = "API_GATEWAY"
  logging_role           = aws_iam_role.sftp_log.arn
  url                    = aws_api_gateway_stage.stage.invoke_url
  invocation_role        = aws_iam_role.sftp.arn
  endpoint_type          = "PUBLIC"
  protocols              = ["SFTP"]

  structured_log_destinations = [
    "${aws_cloudwatch_log_group.transfer.arn}:*"
  ]

  tags = {
    "Name" = var.sftp_name
  }
}
