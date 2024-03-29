data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_route53_zone" "this" {
  count = var.zone_name != "" ? 1 : 0
  name  = var.zone_name
}

data "archive_file" "sftp_idp" {
  type        = "zip"
  source_dir  = join("/", [path.module, "source", "lambda"])
  output_path = local.filename
}
