/* DEFAULT VARIABLES */

### local.tags (Resource tags)
locals {
  tags = {
    Project   = "${var.project}"
    Environ   = "${var.environ}"
    Product   = "myproject"
    Contact   = "vivekyad4v@gmail.com"
    ManagedBy = "tf" # tf, cf, man
  }
}

#### local.meta (Metadata)
locals {
  meta = {
    name_prefix   = "vorg-${var.environ}-${var.project}"
    region_name   = "${var.region}"
    ssm_ps_np     = "/vorg/${var.environ}/${var.project}"
    ssm_ps_np_man = "/vorg/${var.environ}/${var.project}"
  }
}

#### local.vars / local.vars_list (variables for TF resources)
locals {
  vars = {
    vpc-cidr = "${data.aws_ssm_parameter.vpc-cidr.value}"
  }
  vars_lists = {
    public-subnet-cidrs = split(",", data.aws_ssm_parameter.public-subnet-cidrs.value)
    azs                 = split(",", data.aws_ssm_parameter.azs.value)
  }
}

#### Fetch data from parameter store 
data "aws_ssm_parameter" "vpc-cidr" {
  name = "${local.meta["ssm_ps_np_man"]}/vpc-cidr"
}

data "aws_ssm_parameter" "public-subnet-cidrs" {
  name = "${local.meta["ssm_ps_np_man"]}/public-subnet-cidrs"
}

data "aws_ssm_parameter" "azs" {
  name = "${local.meta["ssm_ps_np_man"]}/azs"
}
