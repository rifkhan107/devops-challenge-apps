variable "repository_name" {
  description = "The name of the repository."
  type        = string
}

variable "image_tag_mutability" {
  description = "The tag mutability settings for the repository."
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository."
  type        = bool
  default     = true
}
