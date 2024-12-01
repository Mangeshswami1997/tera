resource "aws_instance" "jocker" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.nano"
    key_name = "ec2m"
    tags = {
      Name = "count"
    }
    count = 1
}