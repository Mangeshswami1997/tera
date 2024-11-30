provider "aws" {
    region = "ap-south-1"
  
}
resource "aws_key_pair" "keypair_creation" {
  key_name   = "terakey"
  public_key = tls_private_key.keypair_creation.public_key_openssh
}

resource "tls_private_key" "keypair_creation" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


resource "aws_instance" "ec2_key" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = aws_key_pair.keypair_creation.key_name
    tags = {
      Name ="role2"
    }
#    depends_on = [keypair_creation]
}