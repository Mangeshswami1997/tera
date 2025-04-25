resource "aws_instance" "name" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "ec2m"
    tags = {
      Name = "cheking"
    }
 
}
resource "aws_s3_bucket" "localbucket1" {
    bucket = "mangeshabc1212"
  
}