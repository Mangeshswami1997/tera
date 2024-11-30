resource "aws_s3_bucket" "local1" {
    bucket = "laturrrr"
  
}
terraform {
  backend "s3" {
    bucket = "mangeshabc"
    region = "ap-south-1"
    key = "day-2/terraform.tfstate"
    
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

resource "aws_dynamodb_table" "experiment_of_locking_state_file" {
    name = "terraform-state-lock-dynamo"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20

    attribute {
      name = "LockID"
      type = "S"
    }
  
}