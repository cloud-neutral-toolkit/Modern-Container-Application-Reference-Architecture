locals {
  config_root = coalesce(var.config_root, abspath("${path.root}/../../../../../gitops"))

  account = yamldecode(
    file("${local.config_root}/config/accounts/dev.yaml")
  )

  nlb_conf = yamldecode(
    file("${local.config_root}/config/resources/dev-nlb/nlb.yaml")
  )
}

module "nlb" {
  source      = "../../modules/nlb"

  name_prefix = local.nlb_conf.name_prefix
  vpc_id      = local.nlb_conf.vpc_id
  subnet_ids  = local.nlb_conf.subnet_ids
  listeners   = local.nlb_conf.listeners

  tags = local.account.tags
}
