locals {
  vpc_cidr = "10.0.0.0/16"
}

locals {
  security_groups = {
    public = {
      name        = "public_sg"
      description = "External Access SG"
      ingress = {
        http = {
          from        = 80
          to          = 80
          protocol    = "tcp"
          cidr_blocks = [var.nlb_acl_cidr_block, local.vpc_cidr, "192.118.32.0/22"]
        }
      }
    }
  }
}
