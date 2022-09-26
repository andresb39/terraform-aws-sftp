resource "aws_route53_record" "this" {
  name    = var.sftp_name
  type    = "CNAME"
  zone_id = data.aws_route53_zone.this.id
  records = [ aws_transfer_server.sftp.endpoint ]
  ttl     = 3600
}