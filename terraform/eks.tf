module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version

  endpoint_public_access                   = true
  enable_cluster_creator_admin_permissions = true

  addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni = {
      before_compute = true
    }
    eks-pod-identity-agent = {
      before_compute = true
    }
    aws-ebs-csi-driver = {
      pod_identity_association = [{
        role_arn        = module.ebs_csi_pod_identity.iam_role_arn
        service_account = "ebs-csi-controller-sa"
      }]
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    workers = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = [var.node_instance_type]

      min_size     = 2
      max_size     = 3
      desired_size = 2
    }
  }
}
