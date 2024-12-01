variable "sandbox" {
    type = list(string)
    default = [ "mmm","nnn" ]
  
}
resource "aws_instance" "for" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.nano"
    key_name = "ec2m"
    for_each = toset(var.sandbox)
    tags = {
      Name= each.value
    }

  
}