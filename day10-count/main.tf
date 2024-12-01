resource "aws_instance" "jocker" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.nano"
    key_name = "ec2m"
    count = 2
    # count = length(var.sandbox)
    tags = {
    Name = "count"
    # Name =  var.sandbox[count.index] # this will create name with mangesh sagar latur--also check varible sandbox
    # Name = "mangesh-${count.index}" #this will created mangesh-1,mangesh-2,mangesh-3 named 3 ec2
    }
 

}
# variable "sandbox" {
#     type = list(string)
#     default = [ "mangesh","sagar","latur" ]
  
# }