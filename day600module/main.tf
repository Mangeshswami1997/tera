resource "aws_instance" "mangesh2" {
    ami = var.myami
    instance_type = var.mytype
    key_name = var.mykey
    tags = {
        Name = "mec2"
      
    }
    
}