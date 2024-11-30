resource "aws_s3_bucket" "localbucket1" {
    bucket = "mangeshabc"
  
}
terraform {
  backend "s3" {
    bucket = "mangeshabc"
    region = "ap-south-1"
    key = "day-1/terraform.tfstate"
    
  }
}
resource "aws_instance" "mangesh2" {
    ami = var.myami
    instance_type = var.mytype
    key_name = var.mykey

    tags = {
        Name = "ec2"
      
    }
    
}