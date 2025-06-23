resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_eip" "nat_eip" {
  for_each = var.public_subnets

  domain = "vpc"

  tags = {
    Name = "${var.name}-nat-eip-${each.key}"
  }
}

resource "aws_nat_gateway" "nat" {
  for_each = var.public_subnets

  allocation_id = aws_eip.nat_eip[each.key].id
  subnet_id     = each.value

  tags = {
    Name = "${var.name}-nat-gw-${each.key}"
  }

  depends_on = [aws_internet_gateway.igw]
}

# Public route tables
resource "aws_route_table" "public" {
  for_each = var.public_subnets

  vpc_id = var.vpc_id

  tags = {
    Name = "${var.name}-public-rt-${each.key}"
  }
}

resource "aws_route" "public_internet_access" {
  for_each = aws_route_table.public

  route_table_id         = each.value.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  for_each = var.public_subnets

  subnet_id      = each.value
  route_table_id = aws_route_table.public[each.key].id
}

# Private route tables
resource "aws_route_table" "private" {
  for_each = var.private_subnets

  vpc_id = var.vpc_id

  tags = {
    Name = "${var.name}-private-rt-${each.key}"
  }
}

resource "aws_route" "private_nat_access" {
  for_each = aws_route_table.private

  route_table_id         = each.value.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[each.key].id
}

resource "aws_route_table_association" "private_assoc" {
  for_each = var.private_subnets

  subnet_id      = each.value
  route_table_id = aws_route_table.private[each.key].id
}

