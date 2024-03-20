terraform {
  backend "s3" {
    bucket         = "tf-state-bucket-0001"
    key            = "state/path/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
