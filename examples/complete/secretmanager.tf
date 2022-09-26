resource "random_password" "password" {
  length  = 18
  special = true
  override_special = "_%@"
}

module "secrets" {
  source = "./secrets"
  name   = "SFTP/${var.user_name}"
  description = "SFTP User Access"

  secrets_maps = {
    Password    = random_password.password.result
    FTPPassword	= random_password.password.result
    Role        = aws_iam_role.role.arn
    FTPRole     = aws_iam_role.role.arn
    HomeDirectory     =	"/${aws_s3_bucket.bucket.bucket}"
    AcceptedIpNetwork = "0.0.0.0/0"
  }
  tags = {
    App = "SFTP"
  }
}