//----------------------------------------------------------------------------------------------

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
//----------------------------------------------------------------------------------------------

resource "aws_key_pair" "key_pair" {
  key_name   = "${var.datacenter}-keypair"
  public_key = tls_private_key.key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.key.private_key_pem}' > ./key.pem"
  }
}
//----------------------------------------------------------------------------------------------
resource "aws_instance" "node" {
  instance_type          = var.ec2_type
  ami                    = var.ami
  key_name               = aws_key_pair.key_pair.id
  vpc_security_group_ids = [var.public_sg]
  subnet_id              = var.public_subnet

  tags = {
    //    Name = "terraform_generated_ec2"
    Name = var.instance_name
  }

  user_data = file("${path.root}/modules/ec2/userdata.tpl")

  root_block_device {
    volume_size = 10
  }
}
//----------------------------------------------------------------------------------------------

resource "aws_eip" "eip" {
  instance = aws_instance.node.id
}

