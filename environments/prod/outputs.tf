# From VPC Module
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

# From Networking Module
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.networking.internet_gateway_id
}

output "nat_gateway_ids" {
  description = "Map of NAT Gateway IDs"
  value       = module.networking.nat_gateway_ids
}

output "public_route_table_ids" {
  description = "Map of public route table IDs"
  value       = module.networking.public_route_table_ids
}

output "private_route_table_ids" {
  description = "Map of private route table IDs"
  value       = module.networking.private_route_table_ids
}
output "public_security_group_id" {
  description = "The ID of the public security group"
  value       = module.security_groups.public_sg_id
}

output "private_security_group_id" {
  description = "The ID of the private security group"
  value       = module.security_groups.private_sg_id
}

output "ec2_instance_ids" {
  value = module.ec2.instance_ids
}

output "ec2_private_ips" {
  value = module.ec2.private_ips
}

output "ec2_public_ips" {
  value = module.ec2.public_ips
}
