variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "monitoring-demo"
}

variable "kubernetes_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.35"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "node_instance_type" {
  description = "Instance type for the managed node group"
  type        = string
  default     = "t3.large"
}
