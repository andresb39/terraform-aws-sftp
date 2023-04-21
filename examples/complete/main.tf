module "sftp" {
  source    = "../.."
  stage     = "prod"
  tags = {
    owner     = "DevOps"
    managered = "terraform"
  }
}
