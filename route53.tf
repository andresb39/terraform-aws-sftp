resource "aws_route53_record" "this" {
	count = var.zone_name != "" ? 1 : 0
  name    = var.sftp_name
  type    = "CNAME"
  zone_id = data.aws_route53_zone.this[0].id
  records = [aws_transfer_server.sftp.endpoint]
  ttl     = 3600
}
