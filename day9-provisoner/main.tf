resource "aws_vpc" "pvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.pvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "pig" {
  vpc_id = aws_vpc.pvpc.id
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.pvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pig.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "pSG" {
  name   = "check_provisoner"
  vpc_id = aws_vpc.pvpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}

resource "aws_instance" "server" {
  ami                    = "ami-0614680123427b75e"
  instance_type          = "t2.micro"
  key_name               ="ec2m"
  vpc_security_group_ids = [aws_security_group.pSG.id]
  subnet_id              = aws_subnet.sub1.id
  tags = {
    Name ="provisoner"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"  # Replace with the appropriate username for your EC2 instance
    private_key = file("C:/Users/hp/Desktop/ec2m.pem")

    host        = self.public_ip
  }


        #   # local execution procee 
        #  provisioner "local-exec" {
        #     command = "touch sagar1000"
        #  }

        # File provisioner to copy a file from local to the remote EC2 instance
        #  provisioner "file" {
        #     source      = "sagar1000"  # Replace with the path to your local file
        #     destination = "/home/ec2-user/sagar1000"  # Replace with the path on the remote instance
        #   }
        
 provisioner "remote-exec" {
    inline = [
"touch head",
"echo just remote experiment >> head",
]
  }
 }
 
 
  # remote execution process 
 
 


 