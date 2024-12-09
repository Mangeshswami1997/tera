
resource "aws_instance" "python_app_instance" {
  ami           = ""  # Update with the correct AMI for your region
  instance_type = "t2.micro"

  tags = {
    Name = "PythonAppInstance"
  }