module sftp {
  source = "../.."
  zone_name = "example.com"
  stage = "prod"
  tags = {
    owner       = "DevOps"
    managered   = "terraform"
  }
}