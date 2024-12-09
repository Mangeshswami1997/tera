
resource "aws_instance" "cec3" {
    ami = var.okami
    instance_type = "t2.micro"
    key_name = "ec2m"
    tags = {
      Name = "condition"
    }
  
}
variable "okami" {
    type = string
    default = ""
  
}

# terraform apply -var="ami=ami-0614680123427b75e"
