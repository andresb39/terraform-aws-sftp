output "endpoint" {
  description = "SFTP EndPoint url"
  value       = aws_transfer_server.sftp.endpoint
}

output "sftp_dns" {
  description = "SFTP DNS"
  value       = try(aws_route53_record.this[0].fqdn, "")
}
