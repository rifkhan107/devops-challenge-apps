variable "cluster_name" {
  description = "The name of the EKS cluster."
}

#variable "subnet_ids" {
#  description = "A list of subnet IDs to deploy the EKS cluster in."
#  type        = list(string)
#}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster."
  default     = "1.29"
}

variable "node_group_name" {
  description = "Name of the EKS node group."
}

variable "desired_size" {
  description = "Desired number of nodes in the node group."
  type        = number
}

variable "max_size" {
  description = "Maximum number of nodes in the node group."
  type        = number
}

variable "min_size" {
  description = "Minimum number of nodes in the node group."
  type        = number
}


# VPC
variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones in which to create subnets"
  type        = list(string)
}

#ECR
variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}


# Declare other missing variables similarly
