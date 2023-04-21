# tfsec:ignore:aws-ssm-secret-use-customer-key
resource "aws_secretsmanager_secret" "secretmanager" {
  name        = var.name
  description = var.description
  tags        = var.tags
}

resource "aws_secretsmanager_secret_version" "secretmanager" {
  secret_id     = aws_secretsmanager_secret.secretmanager.id
  secret_string = jsonencode(var.secrets_maps)
}
