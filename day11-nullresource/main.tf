provider "aws" {
  
}
resource "aws_db_instance" "db1local" {
    identifier = "mangesh"
    allocated_storage = 20
    instance_class = "db.t3.micro"
    engine = "mysql"
    engine_version = "8.0"
    db_name = "databasemangesh"
    username = "sagar"
    password = "sagar123"
    publicly_accessible = false
    skip_final_snapshot = true
    vpc_security_group_ids = [aws_security_group.dsg.id]
    db_subnet_group_name = aws_db_subnet_group.db_sub_g.name
    }
    resource "aws_security_group" "dsg" {
        name = "dbsg"
        ingress {
            from_port = 3306
            to_port = 3306
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
         egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks =  ["0.0.0.0/0"]
         }  
    }
    resource "aws_db_subnet_group" "db_sub_g" {
    name = "rdssubgroup"
    subnet_ids = ["subnet-0cd54992d0c8cba7a","subnet-080e5219cc94955fe"]
      
    }

    resource "null_resource" "data_initializer" {
        depends_on = [ aws_db_instance.db1local ]
        provisioner "local-exec" {
        command = <<EOT
        mysql -h ${aws_db_instance.db1local.address} \
              -u mangesh \
              -p mangesh123
              -e "source ./mdini.sql" 

    EOT
    }
          
         triggers = {
    db_instance_id = aws_db_instance.db1local.id
      
    }
    }