provider "aws" {
    region = "us-east-1"
    alias = "america"
  
}
provider "aws" {
    region = "ap-south-1"
    alias = "mumbai"
  
}
resource "aws_s3_bucket" "l1" {
    bucket = "mmmyyy456"
    provider = aws.america
  
}
resource "aws_instance" "jocker" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "ec2m"
    tags = {
      Name = "mumbairegion"
    }
    provider = aws.mumbai
}