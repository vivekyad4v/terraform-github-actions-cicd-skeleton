output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value     = module.vpc.vpc_cidr
  sensitive = true
}

output "public_subnet_1" {
  value = module.vpc.public_subnet_1
}

output "public_subnet_2" {
  value = module.vpc.public_subnet_2
}
