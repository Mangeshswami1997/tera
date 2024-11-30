# IAM Role creation
resource "aws_iam_role" "for_ec2_to_s3" {
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



resource "aws_iam_role_policy_attachment" "pppolicy" {
  role = aws_iam_role.for_ec2_to_s3.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}


  
resource "aws_instance" "localname" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "ec2m"
    iam_instance_profile = aws_iam_instance_profile.role_attach_ec2.name
    tags = {
      name ="role2"
    }
    # use to dependancy block while destroying time
#  depends_on = [ aws_iam_instance_profile.role_attach_ec2 ]
}
resource "aws_iam_instance_profile" "role_attach_ec2" {
    name = "role2ec2"
    role = aws_iam_role.for_ec2_to_s3.name  
}

