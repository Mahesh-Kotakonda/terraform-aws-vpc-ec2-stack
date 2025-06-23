variable "name" {
  description = "Name prefix for resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "public_subnets" {
  description = "Map of public subnet identifiers (e.g., { a = subnet-1234 })"
  type        = map(string)
}

variable "private_subnets" {
  description = "Map of private subnet identifiers (e.g., { a = subnet-5678 })"
  type        = map(string)
}

