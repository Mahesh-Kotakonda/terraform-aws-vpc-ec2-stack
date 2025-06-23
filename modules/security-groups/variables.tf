variable "vpc_id" {
  description = "VPC ID where SGs will be created"
  type        = string
}

variable "name_prefix" {
  description = "Prefix to name the SGs"
  type        = string
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed to SSH into public instances"
  type        = list(string)
}

