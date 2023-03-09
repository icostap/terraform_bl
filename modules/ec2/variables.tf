variable "datacenter" {
  type = string
  //  default = "leumi"
}

variable "ami" {

}
variable "ec2_type" {

}
variable "public_subnet" {

}

variable "public_sg" {

}

variable "instance_name" {
  description = "EC2 Instance Name"
  default     = "EC2-Test"
}
