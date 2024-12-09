resource "aws_vpc" "cutoVPC" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "cutovpctf"
    }
  
}
resource "aws_subnet" "csub1" {
    vpc_id = aws_vpc.cutoVPC.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      Name ="csub1tfpub"
    }
  
}

resource "aws_subnet" "csub2" {
    vpc_id = aws_vpc.cutoVPC.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1b"
    tags = {
      Name ="csub1tfpvt"
    }
}
resource "aws_internet_gateway" "cig" {
    vpc_id = aws_vpc.cutoVPC.id
    tags = {
      Name = "cig"
    }
}
resource "aws_route_table" "cprt" {
    vpc_id = aws_vpc.cutoVPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.cig.id
    }
    tags = {
      Name ="prt"
    }
  
}
resource "aws_route_table_association" "csa" {
    subnet_id = aws_subnet.csub1.id
    route_table_id = aws_route_table.cprt.id
}
resource "aws_security_group" "allow_ssh_http" {
    vpc_id = aws_vpc.cutoVPC.id
     name        = "allow_ssh_http"
    ingress {
        description = "allow ssh"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}
resource "aws_instance" "cec2" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "ec2m"
    vpc_security_group_ids = aws_security_group.allow_ssh_http.id
    subnet_id     = aws_subnet.csub2.id
    tags = {
      ok = "custom ec2"
    }
}