/*
* Create AWS Secrets Manager to store the credentials
* - [AWS Secrets Manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret)
*/
resource "aws_kms_key" "kms" {
  description             = "KMS key for Secrets Manager"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags                    = var.tags
}

resource "aws_secretsmanager_secret" "secretmanager" {
  name        = var.name
  description = var.description
  kms_key_id  = aws_kms_key.kms.arn
  tags        = var.tags
}

resource "aws_secretsmanager_secret_version" "secretmanager" {
  secret_id     = aws_secretsmanager_secret.secretmanager.id
  secret_string = jsonencode(var.secrets_maps)
}
