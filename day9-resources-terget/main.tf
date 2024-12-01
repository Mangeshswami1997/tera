resource "aws_instance" "lname1" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "ec2m"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "one" 
    }
  
}
resource "aws_s3_bucket" "lname2" {
    bucket = "tttmmm1122"
    tags = {
      Name = "two" 
    }

}
resource "aws_instance" "lname3" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "ec2m"
    availability_zone = "ap-south-1b"
    tags = {
      Name = "three" 
    }
  
}
# IAM Role creation
resource "aws_iam_role" "target_resources_using_loop" {
    name = "mangeshrole"
   assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      }
    ]
  })
#  depends_on = [ aws_instance.localname ]
  
}



resource "aws_iam_role_policy_attachment" "tppolicy" {
  role = aws_iam_role.target_resources_using_loop.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
