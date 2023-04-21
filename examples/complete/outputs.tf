output "dns" {
  description = "SFTP DNS"
  value       = module.sftp.sftp_dns
}

output "endpoint" {
  description = "SFTP endpoint"
  value       = module.sftp.endpoint
}
