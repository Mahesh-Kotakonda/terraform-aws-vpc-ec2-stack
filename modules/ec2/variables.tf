variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instances"
}

variable "instance_type" {
  type        = string
  description = "Instance type for EC2"
}

variable "instances" {
  type = map(object({
    subnet_id                   = string
    security_group_ids          = list(string)
    associate_public_ip_address = bool
    name                        = string
  }))
  description = "Map of instance definitions"
}

variable "key_name" {
  type        = string
  description = "SSH key name"
}

variable "user_data" {
  type        = string
  description = "User data script"
  default     = ""
}

variable "environment" {
  type        = string
  description = "Environment tag"
}

