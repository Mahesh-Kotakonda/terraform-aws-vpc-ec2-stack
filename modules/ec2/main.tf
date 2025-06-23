resource "aws_instance" "ec2" {
  for_each = var.instances

  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = each.value.subnet_id
  vpc_security_group_ids      = each.value.security_group_ids
  associate_public_ip_address = each.value.associate_public_ip_address
  key_name                    = var.key_name
  user_data                   = var.user_data

  tags = {
    Name        = "${each.value.name}-${each.key}"
    Environment = var.environment
  }
}

