provider "aws" {
  profile = "default"
  region  = var.region
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

 exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}
module "eks-kubeconfig" {
  source     = "hyperbadger/eks-kubeconfig/aws"
  version = "2.0.0"
  depends_on = [module.eks]
  cluster_name =  module.eks.cluster_name
}

# resource "kubernetes_manifest" "aspnet-deployment" {
#   yaml_body = file("Eks-Cluster/aspnet-app-deploy.yaml")
# }
# resource "kubernetes_manifest" "db-depl" {
#   yaml_body = file("k8s/mssql-deployment.yaml")
# }



# resource "kubernetes_manifest" "db-secret" {
#   yaml_body = file("k8s/mssql-secret.yaml")
# }


# resource "kubernetes_manifest" "db-service" {
#   yaml_body = file("k8s/mssql-service.yaml")
# }
# resource "kubernetes_manifest" "db-pvolume" {
#   yaml_body = file("k8s/mssql-pvc.yaml")
# }

# resource "kubernetes_manifest" "db-volume" {
#   yaml_body = file("k8s/mssql-pv.yaml")
# }