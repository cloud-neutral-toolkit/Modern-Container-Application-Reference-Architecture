locals {
  config_root = coalesce(var.config_root, abspath("${path.root}/../../../../../gitops"))

  account = yamldecode(
    file("${local.config_root}/config/accounts/dev.yaml")
  )

  s3_conf = yamldecode(
    file("${local.config_root}/config/resources/dev-object/bucket.yaml")
  )
}

module "s3" {
  source = "../../modules/s3"

  bucket_name       = local.s3_conf.bucket_name
  enable_versioning = local.s3_conf.enable_versioning
  tags              = local.account.tags
}
