output "cluster_id" {
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = module.eks.kubeconfig_certificate_authority_data
}

output "node_group_arn" {
  value = module.eks.node_group_arn
}
