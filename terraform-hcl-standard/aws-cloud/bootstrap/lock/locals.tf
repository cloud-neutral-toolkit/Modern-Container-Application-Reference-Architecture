locals {
  config_root = coalesce(var.config_root, abspath("${path.module}/../../../../../gitops"))
  bootstrap_config_path = coalesce(
    var.bootstrap_config_path,
    "${local.config_root}/config/accounts/bootstrap.yaml"
  )

  bootstrap = yamldecode(file(local.bootstrap_config_path))

  dynamodb_table_name = coalesce(var.table_name, local.bootstrap.state.dynamodb_table_name)
  region              = coalesce(var.region, local.bootstrap.region)
  environment         = try(local.bootstrap.environment, "bootstrap")
  tags                = try(local.bootstrap.tags, {})
}
