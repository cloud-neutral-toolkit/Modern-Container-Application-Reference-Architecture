include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../state", "../lock"]
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//bootstrap/identity"
}

locals {
  gitops_repo_root = get_env(
    "GITOPS_REPO_ROOT",
    abspath("${get_parent_terragrunt_dir()}/../../../../../gitops")
  )
  config_root = "${local.gitops_repo_root}/config"
}

inputs = {
  bootstrap_config_path = "${local.config_root}/accounts/bootstrap.yaml"
  config_root           = local.gitops_repo_root
}
