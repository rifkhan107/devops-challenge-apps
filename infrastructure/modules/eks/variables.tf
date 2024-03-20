variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to deploy the EKS cluster in."
  type        = list(string)
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster."
type = string
default = "1.29"
}

variable "node_group_name" {
description = "Name of the EKS node group."
type = string
}

variable "desired_size" {
description = "Desired number of nodes in the node group."
type = number
}

variable "max_size" {
description = "Maximum number of nodes in the node group."
type = number
}

variable "min_size" {
description = "Minimum number of nodes in the node group."
type = number
}
