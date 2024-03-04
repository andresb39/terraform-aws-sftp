resource "aws_kms_key" "sftp_log_group" {
  description = "KMS key for SFTP log group"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "Allow CloudWatch Logs to use the key"
        Effect = "Allow",
        Principal = {
          Service = "logs.${data.aws_region.current.name}.amazonaws.com"
        },
        Action = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ],
        Resource = "*"
      },
      {
        "Sid" : "Enable IAM User Permissions",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        "Action" : "kms:*",
        "Resource" : "*"
      }
    ]
  })
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags                    = var.tags
}

resource "aws_kms_alias" "sftp_log_group" {
  name          = "alias/${var.sftp_name}"
  target_key_id = aws_kms_key.sftp_log_group.key_id
}
