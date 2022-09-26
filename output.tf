  output "endpoint" {
    description = "SFTP EndPoint url"
    value = aws_transfer_server.sftp.endpoint
  }

output "sft_dns" {
  description = "SFTP DNS"
  value = aws_route53_record.this.fqdn
}