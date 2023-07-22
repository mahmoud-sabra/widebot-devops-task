module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "widebot-cluster"
  cluster_version = "1.27"

  cluster_endpoint_public_access = true

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  enable_irsa                    = true
  create_cloudwatch_log_group    = false
  eks_managed_node_groups = {
    one = {
      name = var.node_name

      instance_types = var.node_type

      min_size     = 2
      max_size     = 3
      desired_size = 3
    }
  }
}

