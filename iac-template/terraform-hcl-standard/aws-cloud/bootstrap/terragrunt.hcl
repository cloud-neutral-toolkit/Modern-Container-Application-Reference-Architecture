terraform_version_constraint  = ">= 1.2.0"
terragrunt_version_constraint = ">= 0.67.14"

locals {
  bootstrap_config = yamldecode(file(find_in_parent_folders("config/accounts/bootstrap.yaml")))
}
