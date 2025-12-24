variable "bucket_name" {
  description = "S3 bucket name for Terraform state"
  type        = string
  default     = null
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = null
}

variable "bootstrap_config_path" {
  description = "Path to the bootstrap account configuration YAML"
  type        = string
  default     = null
}

variable "config_root" {
  description = "Local path to the gitops repository root."
  type        = string
  default     = null
}

variable "create_bucket" {
  description = "Whether to create the Terraform state bucket. Set to false to use an existing bucket."
  type        = bool
  default     = true
}
