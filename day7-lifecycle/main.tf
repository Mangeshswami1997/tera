resource "aws_instance" "jocker" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "ec2m"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "myli" 
    }
lifecycle {
    prevent_destroy = false
   
}
# lifecycle {
#    # ignore_changes = [ tags ]
# }
# lifecycle {
#    create_before_destroy = false
# }
}
