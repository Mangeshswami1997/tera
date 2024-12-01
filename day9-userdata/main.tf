
  resource "aws_instance" "lname1" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "ec2m"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "data" 
    }
    user_data = file("ud.sh")
  
}
