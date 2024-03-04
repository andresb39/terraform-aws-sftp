variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "sftp_name" {
  description = "The name of the SFTP server"
  type        = string
  default     = "sftp"
}

variable "stage" {
  description = "Stage (e.g. dev, test, prod)"
  default     = "dev"
  type        = string
}

variable "zone_name" {
  description = "The name of the Route53 zone"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "sftp"
    Team        = "DevOps"
    ManagedBy   = "Terraform"
  }
}
