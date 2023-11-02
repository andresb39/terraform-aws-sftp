output "secret" {
  value       = aws_secretsmanager_secret.secretmanager.arn
  description = "Secret ARN"
}
