output "dns" {
  description = "The DNS of the SFTP server (e.g. sftp.example.com)"
  value       = module.sftp.sftp_dns
}

output "endpoint" {
  description = "The endpoint of the SFTP server (e.g. s-12345678.server.transfer.us-west-2.amazonaws.com)"
  value       = module.sftp.endpoint
}
