output "cluster_id" {
  description = "The ID of the EKS cluster."
  value       = aws_eks_cluster.example.id
}

output "cluster_arn" {
  description = "The ARN of the EKS cluster."
  value       = aws_eks_cluster.example.arn
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = aws_eks_cluster.example.endpoint
}

output "kubeconfig_certificate_authority_data" {
  description = "The certificate authority data for the EKS cluster."
  value       = aws_eks_cluster.example.certificate_authority[0].data
}

output "node_group_arn" {
  description = "The ARN of the node group."
  value       = aws_eks_node_group.example.arn
}

output "node_group_role_name" {
  description = "The name of the IAM role used by the node group."
  value       = aws_iam_role.node.name
}
