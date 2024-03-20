# VPC Module Variables
cidr_block           = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
availability_zones   = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

# EKS Module Variables
cluster_name    = "my-eks-cluster"
cluster_version = "1.29"
node_group_name = "my-node-group"
desired_size    = 2
max_size        = 3
min_size        = 1


# ECR Module Variables
repository_name      = "my-application-repo"
account_id           = "123456789012" # Your AWS Account ID
