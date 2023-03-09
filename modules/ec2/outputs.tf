output "ec2_id" {
  value = aws_instance.node.id
}

output "ec2_public_dns" {
  value = aws_eip.eip.public_dns
}

output "ec2_public_ip" {
  value = aws_eip.eip.public_ip
}
