output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gateway_ids" {
  value = { for k, nat in aws_nat_gateway.nat : k => nat.id }
}

output "public_route_table_ids" {
  value = { for k, rt in aws_route_table.public : k => rt.id }
}

output "private_route_table_ids" {
  value = { for k, rt in aws_route_table.private : k => rt.id }
}

