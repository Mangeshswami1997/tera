resource "aws_instance" "mangesh1" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.nano"
    key_name = "ec2m"

}
