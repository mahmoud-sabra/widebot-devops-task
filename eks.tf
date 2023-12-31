module "eks" {
      source  = "terraform-aws-modules/eks/aws"
      version = "~> 19.0"

      cluster_name    = "widebot-cluster"
      cluster_version = "1.27"

      cluster_endpoint_public_access = true

      vpc_id                      = module.vpc.vpc_id
      subnet_ids                  = module.vpc.private_subnets
      enable_irsa                 = true
      create_cloudwatch_log_group = false
      eks_managed_node_groups = {
        one = {
          name = var.node_name

          instance_types = var.node_type

          min_size     = 2
          max_size     = 3
          desired_size = 2
        }
      }
    }

    # Deployment for the multi-container pod
    resource "kubernetes_deployment_v1" "multi_container_pod" {
      metadata {
        name = "aspnet-deployment"
      }

      spec {
        replicas = 3 # Set the desired number of replicas

        selector {
          match_labels = {
            app = "aspnet"
          }
        }

        template {
          metadata {
            labels = {
              app = "aspnet"
            }
          }

          spec {
            # app
            # Container 1
container {
  name  = "app"
  image = "ma7moudsabra/aspnet:latest"
  port {
    container_port = 80
  }
  env {
    name  = "ASPNET_ENVIRONMENT"
    value = "Production"
  }
  # Add container1-specific configurations here
}

# Container 3 (Redis)
container {
  name  = "redis-container"
  image = "redis:latest"
  port {
    container_port = 6379
  }
  env {
    name  = "REDIS_ENVIRONMENT"
    value = "Production"
  }
  # Add container3-specific configurations here
}
}
        }
      }
    }