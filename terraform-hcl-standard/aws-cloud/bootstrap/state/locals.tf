locals {
  config_root = coalesce(var.config_root, abspath("${path.module}/../../../../../gitops"))
  bootstrap_config_path = coalesce(
    var.bootstrap_config_path,
    "${local.config_root}/config/accounts/bootstrap.yaml"
  )

  bootstrap = yamldecode(file(local.bootstrap_config_path))

  bucket_name = coalesce(var.bucket_name, local.bootstrap.state.bucket_name)
  region      = coalesce(var.region, local.bootstrap.region)
  environment = try(local.bootstrap.environment, "bootstrap")
  tags        = try(local.bootstrap.tags, {})

  bucket_arn = var.create_bucket ? aws_s3_bucket.state[0].arn : data.aws_s3_bucket.existing[0].arn
  bucket_id  = var.create_bucket ? aws_s3_bucket.state[0].id : data.aws_s3_bucket.existing[0].id
}
