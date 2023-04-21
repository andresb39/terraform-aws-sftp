variable "name" {
  description = "Name for resources"
  type        = string
}

variable "secrets_maps" {
  description = "A Key/Value map of secrets that will be added to AWS Secrets"
  type        = map(string)
}

variable "description" {
  description = "Description for resources"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}
