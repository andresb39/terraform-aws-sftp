output "endpoint" {
  description = "The endpoint of the SFTP server (e.g. s-12345678.server.transfer.us-west-2.amazonaws.com)"
  value       = aws_transfer_server.sftp.endpoint
}

output "sftp_dns" {
  description = "The DNS of the SFTP server (e.g. sftp.example.com)"
  value       = try(aws_route53_record.this[0].fqdn, "")
}
