module "vpc" {
  source = "./vpc"

  tags           = local.tags
  meta           = local.meta
  vpc-cidr       = local.vars["vpc-cidr"]
  public-subnets = local.vars_lists["public-subnet-cidrs"]
  azs            = local.vars_lists["azs"]
}
