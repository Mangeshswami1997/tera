resource "aws_instance" "web" {
  ami                    = "ami-0614680123427b75e"    
  instance_type          = "t2.micro"
  key_name               = "ec2m"              
 
  tags = {
    Name = "forloop"
  }


  }


resource "aws_security_group" "fsg" {
  name        = "devops-project-veera"
  description = "allow below rules"

  ingress = [
    for port in [22, 80, 443, 8080,] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-project-veera"
  }
}