#module "eks" {
#  source          = "terraform-aws-modules/eks/aws"
#  version         = "~> 19.0"
#  cluster_name    = "youtbue-eks"
#  cluster_version = "1.24"
#  vpc_id     = module.vpc.vpc_id
#  subnet_ids = module.vpc.private_subnets
#  cluster_endpoint_public_access  = true # this could be declare in false
#  cluster_endpoint_private_access = true #
#  cluster_addons = {
#    coredns = {
#      resolve_conflict = "OVERWIRTE"
#    }
#    vpc_cni = {
#      resolve_conflict = "OVERWIRTE"
#    }
#    kube-proxy = {
#      resolve_conflict = "OVERWIRTE"
#    }
#    csi = {
#      resolve_conflict = "OVERWIRTE"
#    }
#  }
#  manage_aws_auth_configmap = true
#  eks_managed_node_groups = {
#    node-group = {
#      desired_capacity = 1
#      max_capacity     = 2
#      min_capacity     = 1
#      instance_types   = ["t3.medium"]
#      tags = {
#        Envionment = "tutorial"
#      }
#    }
#  }
#  tags = {
#    Terraform  = "true"
#    Envionment = "tutorial"
#  }
#}