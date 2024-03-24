module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  subnet_ids      = module.vpc.public_subnet_ids
  cluster_version = var.cluster_version
  node_group_name = var.node_group_name
  desired_size    = var.desired_size
  max_size        = var.max_size
  min_size        = var.min_size
}



module "ecr" {
  source           = "./modules/ecr"
  repository_name  = "my-application-repo"
}
