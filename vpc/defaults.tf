/* DEFAULT VARIABLES */

variable "tags" {
  type = map
}
locals {
  environ = var.tags["Environ"]
  project = var.tags["Project"]
}

variable "meta" {
  type = map
}
locals {
  name_prefix = var.meta["name_prefix"]
}

/* CUSTOM VARIABLES */

variable "azs" {type = list}

variable "vpc-cidr" { type = string }

variable "public-subnets" { type = list }
