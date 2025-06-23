output "instance_ids" {
  value = { for k, inst in aws_instance.ec2 : k => inst.id }
}

output "private_ips" {
  value = { for k, inst in aws_instance.ec2 : k => inst.private_ip }
}

output "public_ips" {
  value = {
    for k, inst in aws_instance.ec2 :
    k => inst.public_ip if inst.associate_public_ip_address
  }
}

