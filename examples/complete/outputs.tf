output "dns" {
  description = "SFTP DNS"
  value       = module.sftp.sft_dns
}

output "endpoint" {
  description = "SFTP endpoint"
  value       = module.sftp.endpoint
}
