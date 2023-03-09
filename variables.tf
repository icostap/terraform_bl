variable "datacenter" {
  type = string
  default = "leumi"
}

variable "aws_region" {
  description = "Region"
  type        = string
  default     = "us-west-2"
}

variable "ec2_type" {
  default = "t2.micro"
}

# White list to access nlb
variable "nlb_acl_cidr_block" {
  type    = string
  default = "91.231.246.50/32"
}

variable "instance_name" {
  description = "EC2 Instance Name"
  default     = "EC2 Test"
}

variable "ami" {
  description = "AMI FOR EC2, Note that fits only to Oregon"
  default     = "ami-0892d3c7ee96c0bf7"
}