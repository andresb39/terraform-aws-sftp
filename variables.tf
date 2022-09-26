variable "sftp_name" {
  description = "SFTP DNS Name"
  type = string
  default = "sftp"
}

variable "stage" {
  description = "The deployment stage"
  default     = "dev"
  type = string
}

variable "zone_name" {
  description = "Zona Name"
  type = string
  default = ""
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}