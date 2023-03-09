output "ec2_public_ip" {
  value = module.ec2.ec2_public_ip
}

output "ec2_public_dns" {
  value = module.ec2.ec2_public_dns
}

output "nlb_dns" {
  value = module.nlb.nlb_dns
}

