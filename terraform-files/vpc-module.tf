// Craete VPC using Module
module "k8_vpc" {
  source              = "terraform-aws-modules/vpc/aws"
  version             = "1.60.0"
  name                = "${local.vpc_name}"
  cidr                = "10.10.0.0/16"

  azs                 = ["${local.zones}"]
  private_subnets     = ["10.10.1.0/24", "10.10.2.0/24"]
  public_subnets      = ["10.10.3.0/24", "10.10.4.0/24"]
  enable_nat_gateway  = true

  tags = {

    // Tags to support Kops
    "kubernetes.io/cluster/${local.k8_cluster_name}"          = "shared"
    "terraform"                                               = true
    "environment"                                             = "dev"
  }

  // Tags required by k8s Ref https://github.com/terraform-aws-modules/terraform-aws-vpc
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = true
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = true
  }

}
