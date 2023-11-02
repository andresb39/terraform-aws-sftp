resource "aws_transfer_server" "sftp" {
  identity_provider_type = "API_GATEWAY"
  logging_role           = aws_iam_role.sftp_log.arn
  url                    = aws_api_gateway_stage.stage.invoke_url
  invocation_role        = aws_iam_role.sftp.arn
  endpoint_type          = "PUBLIC"

  tags = merge({
    "Name" = "SFTP"
    },
    var.tags
  )
}
