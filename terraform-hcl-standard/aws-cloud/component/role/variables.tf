variable "config_files" {
  description = "Ordered list of config files: [account_config]."
  type        = list(string)
  default     = []
}

variable "config_root" {
  description = "Local path to the gitops repository root."
  type        = string
  default     = null
}
