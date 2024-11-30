data "aws_subnet" "selected" {
    filter {
        name = "tag:Name"
        values = ["csub1tfpvt"]
    }  
  
}
resource "aws_instance" "okk" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "ec2m"
    subnet_id = data.aws_subnet.selected.id
}
