output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "ebs_csi_role_arn" {
  description = "IAM role used by the EBS CSI driver (Pod Identity)"
  value       = module.ebs_csi_pod_identity.iam_role_arn
}

output "configure_kubectl" {
  description = "Command to configure kubectl"
  value       = "aws eks update-kubeconfig --name ${module.eks.cluster_name} --region ${var.region}"
}
