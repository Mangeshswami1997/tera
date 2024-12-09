provider "aws" {
  
}
variable "ec4" {
    description = "condition for instance"
  type = bool
  default = false
}
resource "aws_instance" "cec3" {
    count = var.ec4? 1:0
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "ec2m"
    tags = {
      Name = "condition"
    }
  
}