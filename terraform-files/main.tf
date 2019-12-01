provider "aws" {
  region = "ap-southeast-1"
}

locals {
  zones = ["ap-southeast-1a", "ap-southeast-1b"]
  domain_name = "stackbooks-dev.stackroute.io"
  s3_kops_state = "k8-state.${local.domain_name}"
  k8_cluster_name = "k8.${local.domain_name}"
  ingress_ips = ["10.10.1.0/24" , "10.10.2.0/24"]
  vpc_name = "k8-vpc-${local.domain_name}"
  tags ={

    terraform = true
  }
}


data "aws_region" "current" {}
