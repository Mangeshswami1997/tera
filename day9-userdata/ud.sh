#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start
sudo systemctl enable httpd
echo "<h1> HI MANGESH IS HERE </h> " > /var/www/html/index.html